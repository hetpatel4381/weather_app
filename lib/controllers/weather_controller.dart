import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherController {
  Future<Weather> getWeather(String cityName) async {
    try {
      final Map<String, dynamic> weatherData =
          await WeatherApi.fetchWeather(cityName);
      final double temperature = weatherData['location']['name'];
      final String weatherDescription =
          weatherData['current']['condition']['text'];

      return Weather(
        cityName: cityName,
        temperature: temperature,
        weatherDescription: weatherDescription,
      );
    } catch (e) {
      rethrow;
    }
  }
}
