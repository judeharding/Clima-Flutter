import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

const apiKey = '';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    print('INITSTATE CALLED ON LOADING SCREEN');
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('DEACTIVATE CALLED ON LOADING SCREEN');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=imperial');
    //OR
//    'https://api.openweathermap.org/data/2.5/weather?lat={$location.latitude&}lon={$location.longitude}&appid=$apiKey&units=imperial');
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      //PASSING DATA FROM THE LOCATION SCREEN TO THE LOADING SCREEN
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    print(
        'BUILD CALLED ON LOADING SCREEN -- but do not put a lot of stuff here b/c it makes it slow');

    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

// LIFE Cycle of a stateFULL widget
//init
//build
//deactivate
