import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
      Map<String, dynamic>? weather;

  
  Future<void> weatherDetails() async {
    try {
      final url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=11.2587392&longitude=75.9478778&current_weather=true",
      );

      final reponse = await http.get(
        url,
        headers: ({"Content-Type": "application/json"}),
      );
      if (reponse.statusCode == 200) {
        final Map<String,dynamic> data = jsonDecode(reponse.body);
        weather = data;
        notifyListeners();
      } else {
        debugPrint("error while Loading");
      }
    } catch (e) {
      debugPrint("the error is $e");
    }
  }
}

