import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  static const String baseUrl = '';
  static const String apiKey = '';

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
