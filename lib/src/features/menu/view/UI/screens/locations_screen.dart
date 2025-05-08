import 'package:coffeeshop/src/features/menu/bloc/menu/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsScreen extends StatefulWidget {
  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
  const LocationsScreen({super.key});
}

class _LocationsScreenState extends State<LocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Наши кофейни')),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          final locations = state.locations;
          if (locations.isEmpty) {
            return const Center(child: Text('Нет доступных локаций'));
          }
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(locations[index].address));
            },
          );
        },
      ),
    );
  }
}
