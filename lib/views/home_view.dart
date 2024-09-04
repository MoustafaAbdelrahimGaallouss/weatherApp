import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_Model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/Providers/weather_Provider.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void UpdateUi() {
    setState(() {});
  }

  @override
  void initState() {
    UpdateUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    weatherModel? weatherData;
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
        appBar: AppBar(
          //  backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchView(
                    UpdateUi: UpdateUi,
                  );
                }));
              },
              icon: const Icon(Icons.search),
            )
          ],
          title: const Text('Weather App'),
        ),
        body: weatherData == null
            ? const NoWeatherBody()
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      weatherData.getThemeColor(),
                      weatherData.getThemeColor()[300]!,
                      weatherData.getThemeColor()[100]!,
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Updated at : ${weatherData.date}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData
                            .getImage(weatherData.weatherStateName!)),
                        Text(
                          "${weatherData.temp}",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('Max Temp : ${weatherData.maxTemp ?? 0}'),
                            Text("Min Temp : ${weatherData.minTemp ?? 0}"),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData.weatherStateName ?? '',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                )));
  }
}
