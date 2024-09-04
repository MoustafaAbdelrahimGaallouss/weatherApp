import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class weatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;

  //Make by Eng:Tharwat
  weatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  //named Constarctor
  //Make by Eng:Tharwat
  factory weatherModel.fromJson(
    dynamic data,
  ) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return weatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  

  String getImage(String stateName) {
    List<Map<String, String>> weatherStates = [
      {'Clear': "assets/images/clear.png"},
      {'Cloudy': "assets/images/cloudy.png"},
      {'Rainy': "assets/images/rainy.png"},
      {'Snow': "assets/images/snow.png"},
      {'Thanderstorm': "assets/images/thanderstorm.png"},
    ];

    for (var state in weatherStates) {
      if (state.containsKey(stateName)) {
        return state[stateName]!;
      }
    }

    return "assets/images/clear.png";
  }



    MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;          
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.blue;
    }
  }

}
