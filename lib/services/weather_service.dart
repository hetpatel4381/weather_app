import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static const String apiKey = '88363155606786df820b0344b90c26ce';

  static Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final response =
        await http.get(Uri.parse('${baseUrl}?key=${apiKey}&q=${cityName}'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load Weather Data");
    }
  }
}
