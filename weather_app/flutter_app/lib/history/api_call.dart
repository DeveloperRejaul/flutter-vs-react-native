import 'dart:convert';
import 'dart:ui';
import 'package:flutter_app/secret.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/weather_card.dart';
import 'package:flutter_app/weather_item.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double temp = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    try {
      getCurrentWeather();
    } catch (e) {
      print(e);
    }
  }

  Future getCurrentWeather() async {
    try {
      setState(() {
        isLoading = true;
      });
      final res = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city,uk&APPID=$apiKey"));

      final data = jsonDecode(res.body);

      if (data["cod"] != "200") {
        throw "Something went wrong!";
      }

      setState(() {
        temp = data["list"][0]["main"]["temp"];
        isLoading = false;
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text("$temp k",
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                const Icon(
                                  Icons.cloud,
                                  size: 64,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Rain",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Weather forecast",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          WeatherCard(
                            time: "00:00",
                            icon: Icons.cloud,
                            tem: "301.22",
                          ),
                          WeatherCard(
                            time: "06:00",
                            icon: Icons.sunny,
                            tem: "300.52",
                          ),
                          WeatherCard(
                            time: "09:00",
                            icon: Icons.cloud,
                            tem: "302.22",
                          ),
                          WeatherCard(
                            time: "12:00",
                            icon: Icons.sunny,
                            tem: "304.12",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeatherItem(
                        label: "Humidity",
                        icon: Icons.water_drop,
                        value: "91",
                      ),
                      WeatherItem(
                        label: "Wind Speed",
                        icon: Icons.air,
                        value: "7.5",
                      ),
                      WeatherItem(
                        label: "Pressure",
                        icon: Icons.beach_access,
                        value: "1000",
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
