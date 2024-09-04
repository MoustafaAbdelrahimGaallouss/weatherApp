import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_Model.dart';
import 'package:weather_app/Providers/weather_Provider.dart';
import 'package:weather_app/Services/weather_Services.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  SearchView({super.key, this.UpdateUi});
  String? cityName;
  VoidCallback? UpdateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orange[400],
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherServices services = WeatherServices();

              weatherModel? weather =
                  await services.getWearther(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherServices services = WeatherServices();

                      weatherModel? weather =
                          await services.getWearther(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                hintText: 'Enter a city',
                labelText: 'Search'),
          ),
        ),
      ),
    );
  }
}
