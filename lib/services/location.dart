import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
//      print('LONG AND LAT FROM LOCATION.DART');
//      print(latitude);
//      print(longitude);
    } catch (e) {
      print(e);
//      if (e == null) {
//        throw 'permission not granted';
//      }
    }
  }
}
