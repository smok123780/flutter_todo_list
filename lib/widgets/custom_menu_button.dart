import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            width: 35,
            color: Colors.grey[700],
          ),
          Container(
            height: 8,
            color: Colors.white,
          ),
          Container(
            height: 1,
            width: 18,
            color: Colors.grey[700],
          ),
          Container(
            height: 8,
            color: Colors.white,
          ),
          Container(
            height: 1,
            width: 35,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
