import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
//
import 'package:clima/services/networking.dart';

const apiKey = '112203528720759b20c51b5ff4ce5b90';

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
    print('initState called');
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'build called -- but do not put a lot of stuff here b/c it makes it slow');

    return Scaffold(

//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            getLocation();
//          },
//          child: Text('Get Location'),
//        ),
//      ),
        );
  }
}

// LIFE Cycle of a stateFULL widget
//init
//build
//deactivate
