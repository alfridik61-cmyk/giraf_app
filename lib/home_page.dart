import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_appp/task_screen.dart';
import 'package:training_appp/utilits.dart';
import 'package:training_appp/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WeatherProvider>().weatherDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "HOMEPAGE",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30),
            Text(
              "WEATHER",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.symmetric(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "temperature : ${provider.weather?["current_weather"]["temperature"]}",
                          ),
                          SizedBox(height: 20),
                          Text(
                            "wind direction : ${provider.weather?["current_weather"]["winddirection"]}",
                          ),
                          SizedBox(height: 20),
                          Text(
                            "wind speed : ${provider.weather?["current_weather"]["windspeed"]}",
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Lists(),
            Lists(),
            Lists(),
            Lists(),
            Lists(),
            Lists(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
