import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;

  const CustomTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 8),
        child: Text(
     text,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold
            )
          ),
         )
       );
  }
}



