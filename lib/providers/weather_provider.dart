import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../controllers/weather_controller.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  final WeatherController _weatherController = WeatherController();

  Weather? get weather => _weather;

  Future<void> fetchWeather(String cityName) async {
    try {
      final Weather fetchedWeather =
          await _weatherController.getWeather(cityName);
      _weather = fetchedWeather;
    } catch (e) {
      print("Failed to fetch weather: $e");
    }
  }
}
