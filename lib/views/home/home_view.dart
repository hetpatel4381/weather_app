import 'package:flutter/material.dart';
import '../../models/weather_model.dart';
import '../../providers/weather_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final Weather? weather = weatherProvider.weather;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (weather != null)
            Column(
              children: [
                Text(
                  "City: ${weather.cityName}",
                  style: const TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 10),
                Text(
                  "Temperature: ${weather.temperature}°C",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  "Weather: ${weather.weatherDescription}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              weatherProvider.fetchWeather(weather!.cityName);
            },
            child: const Text("Get Weather"),
          ),
        ],
      ),
    );
  }
}
