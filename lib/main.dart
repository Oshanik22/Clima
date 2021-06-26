import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
      sliderTheme: SliderTheme.of(context).copyWith(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        activeTrackColor: Colors.white,
        thumbColor: Color(0xffeb1555),
        overlayColor: Color(0x39eb1555),
        inactiveTrackColor: Color(0xff8d8e98),

      ),
      primaryColor: Color(0xff0d1321),
      scaffoldBackgroundColor: Color(0xff0d1321),


    ),
      home: LoadingScreen(),
    );
  }
}
