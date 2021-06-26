import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temparature;
  int id;
  String cityName;


  @override
  void initState() {
    print(widget.locationWeather);
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic weatherData){
    setState(() {
      var temp = weatherData['main']['temp'];
      temparature = temp.toInt();
      id= weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {

  WeatherModel weatherModel = WeatherModel();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),//TODO: Put a better UI, use the reusable card made in bmi calculator
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()  async {
                      var weatherData =  await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var city = await Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return CityScreen();
                        }
                      ));

                      if(city != null){
                        var weatherData = await weatherModel.getCityWeather(city);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '  $temparature°',
                    style: kTempTextStyle,
                  ),

                  Text(
                    weatherModel.getWeatherIcon(id),
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '${weatherModel.getMessage(temparature)} in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


