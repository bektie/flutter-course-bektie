import 'package:coffeeshop/src/features/menu/view/UI/screens/locations_screen.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(),
          Positioned(
            top: 40,
            left: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.black),
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
                  MaterialPageRoute(builder: (context) => LocationsScreen()),
                );
              },
              child: Icon(Icons.map, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
