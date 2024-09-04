import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_Model.dart';

class WeatherProvider extends ChangeNotifier {
  weatherModel? _weatherData;
  String?cityName;
  set  weatherData(weatherModel? weather){
    _weatherData=weather;
    notifyListeners();
  }

  weatherModel? get weatherData=>_weatherData;

}