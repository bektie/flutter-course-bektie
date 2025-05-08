import 'package:coffeeshop/src/features/menu/bloc/menu/menu_bloc.dart';
import 'package:coffeeshop/src/features/menu/models/models/locations_model.dart';
import 'package:coffeeshop/src/features/menu/view/UI/screens/locations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late YandexMapController _controller;

  List<PlacemarkMapObject> _parsePlacemarks(List<LocationsModel> locations) {
    return locations.map((loc) {
      return PlacemarkMapObject(
        mapId: MapObjectId(loc.address),
        point: Point(latitude: loc.lat, longitude: loc.lng),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            anchor: Offset(0.5, 0.9),
            image: BitmapDescriptor.fromAssetImage('assets/marker.png'),
            scale: 1,
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
          if (locations == null || locations.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              YandexMap(
                onMapCreated: (controller) {
                  _controller = controller;

                  final state = context.read<MenuBloc>().state;
                  if (state.locations.isNotEmpty) {
                    final point = Point(
                      latitude: state.locations.first.lat,
                      longitude: state.locations.first.lng,
                    );
                    controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: point, zoom: 15),
                      ),
                      animation: const MapAnimation(
                        type: MapAnimationType.smooth,
                        duration: 1,
                      ),
                    );
                  }
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
