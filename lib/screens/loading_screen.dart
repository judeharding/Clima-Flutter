import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // async and await go hand in hand - goes on in the background
  void getLocation() async {
    Position position = await Geolocator()
        // the more "accurate" you are below, the more battery you will use
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
//    super.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            getLocation();
//          },
//          child: Text('Get Location'),
//        ),
          ),
    );
  }
}
