import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_Provider.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProvider>(context).weatherData == null
                ? Colors.blue
                : Provider.of<WeatherProvider>(context)
                    .weatherData!
                    .getThemeColor(),
                    useMaterial3:false
      ),
      home: HomeView(),
    );
  }

}
