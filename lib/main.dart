import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_appp/home_page.dart';
import 'package:training_appp/login_page.dart';
import 'package:training_appp/weather_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(home: LoginPage()),
    );
  }
}
