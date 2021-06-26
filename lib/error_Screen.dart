import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          child: Text(
            'An error has occured. Please check if you have location services enabled, and your internet connection'
          ),
        ),
      ),
    );
  }
}
