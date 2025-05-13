import 'package:coffeeshop/src/features/menu/bloc/menu/menu_bloc.dart';
import 'package:coffeeshop/src/features/menu/models/models/locations_model.dart';
import 'package:coffeeshop/src/features/menu/view/UI/screens/locations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<PlacemarkMapObject> _parsePlacemarks(List<LocationsModel> locations) {
    return locations.map((loc) {
      return PlacemarkMapObject(
        mapId: MapObjectId(loc.address),
        point: Point(latitude: loc.lat, longitude: loc.lng),
        onTap: (_, __) {
          showModalBottomSheet(
            context: context,
            builder:
                (_) => SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(loc.address, style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MenuBloc>().add(LocationSelected(loc));
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('Выбрать'),
                      ),
                    ],
                  ),
                ),
          );
        },
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            anchor: Offset(0.5, 0.9),
            image: BitmapDescriptor.fromAssetImage('assets/marker.png'),
            scale: 0.3,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          final locations = state.locations;

          if (locations.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              YandexMap(
                onMapCreated: (controller) async {
                  bool serviceEnabled =
                      await Geolocator.isLocationServiceEnabled();
                  if (!serviceEnabled) return;

                  LocationPermission permission =
                      await Geolocator.checkPermission();
                  if (permission == LocationPermission.denied) {
                    permission = await Geolocator.requestPermission();
                    if (permission == LocationPermission.denied) return;
                  }

                  final position = await Geolocator.getCurrentPosition();
                  final userPoint = Point(
                    latitude: position.latitude,
                    longitude: position.longitude,
                  );

                  controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: userPoint, zoom: 15),
                    ),
                    animation: const MapAnimation(
                      type: MapAnimationType.smooth,
                      duration: 1,
                    ),
                  );
                },
                mapObjects: _parsePlacemarks(locations),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LocationsScreen()),
                    );
                  },
                  child: const Icon(Icons.map, color: Colors.black),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
