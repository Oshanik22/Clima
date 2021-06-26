

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityname;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(

          
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20.0),
              child: Column(

                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      decoration: kInputDecoration,
                      onChanged: (value){
                        print(value);
                        cityname = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, cityname);
                    },
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
