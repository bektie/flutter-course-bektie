import 'package:flutter/material.dart';


class ErrorLoadScreen extends StatelessWidget{
  const ErrorLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Error loading data'),
      ),
    );
  }
}