import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
//

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('initState called');
    getLocation();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
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
