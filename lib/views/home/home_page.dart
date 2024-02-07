import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.weatherData});

  final weatherData;

  String _getBackgroundImage() {
    String description = weatherData.description.toLowerCase();

    if (description.contains('sunny')) {
      return '';
    } else if (description.contains('rain')) {
      return '';
    } else if (description.contains('snow')) {
      return '';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_getBackgroundImage()),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Weather in ${weatherData.city}",
              style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
