import 'package:flutter/material.dart';
import 'package:frontend/providers/theme_provider.dart';
import 'package:frontend/providers/weather_provider.dart';
import 'package:frontend/views/home/home_page.dart';
import 'package:frontend/views/settings/settings_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themeprovider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: Consumer<Themeprovider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: "Weather App",
            theme: themeProvider.currentTheme,
            home: HomePage(),
            routes: {
              SettingsPage.routeName: (context) => SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
