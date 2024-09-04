import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_Model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '09dbc43dbb2241b18df90223242408';
  Future<weatherModel?> getWearther({required String cityName}) async {
    weatherModel? weatherData;
  try {
      //https://api.weatherapi.com/v1/forecast.json?key=09dbc43dbb2241b18df90223242408&q=qena&days=5
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    
    weatherData = weatherModel.fromJson(data);
    
  } catch (e) {
    print(e);
  }
   print('///////////////////////////////////////////////////////////////////////////////////////');
  print(weatherData);
    return weatherData;
  }
}
