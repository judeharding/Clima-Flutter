import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';

///TODO:  remove the api key  add the api key
const apiKey = '112203528720759b20c51b5ff4ce5b90';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
//

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    // getting city data ENTERED
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=imperial';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  //METRIC
//  String getMessage(int temp) {
//    if (temp > 25) {
//      return 'It\'s 🍦 time';
//    } else if (temp > 20) {
//      return 'Time for shorts and 👕';
//    } else if (temp < 10) {
//      return 'You\'ll need 🧣 and 🧤';
//    } else {
//      return 'Bring a 🧥 just in case';
//    }
//  }

// IMPERIAL
  String getMessage(int temp) {
    if (temp > 80) {
      return 'It\'s 🍦 time';
    } else if (temp > 70) {
      return 'Time for shorts and 👕';
    } else if (temp < 40) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
