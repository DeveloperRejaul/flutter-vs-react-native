import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_app/secret.dart';
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
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city,uk&APPID=$apiKey"));

      final data = jsonDecode(res.body);

      if (data["cod"] != "200") {
        throw "Something went wrong!";
      }

      return data;
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
          IconButton(
              onPressed: () {
                setState(() {
                  weather = getCurrentWeather();
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final data = snapshot.data!;
          final temp = data["list"][0]["main"]["temp"];
          final weatherType = data["list"][0]["weather"][0]["main"];
          final pressure = data["list"][0]["main"]["pressure"];
          final humidity = data["list"][0]["main"]["humidity"];
          final speed = data["list"][0]["wind"]["speed"];

          return Padding(
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
                              Icon(
                                weatherType == "Clouds" || weatherType == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                weatherType,
                                style: const TextStyle(fontSize: 20),
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
                /* SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 39; i++) ...[
                          WeatherCard(
                            time: snapshot.data["list"][i + 1]["dt"].toString(),
                            icon: snapshot.data["list"][i + 1]["weather"][0]
                                            ["main"] ==
                                        "Clouds" ||
                                    snapshot.data["list"][i + 1]["weather"][0]
                                            ["main"] ==
                                        "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                            tem: snapshot.data["list"][i + 1]["main"]["temp"]
                                .toString(),
                          ),
                        ]
                      ],
                    ),
                  ),
                ), */
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final time = DateTime.parse(
                            data["list"][index + 1]["dt_txt"].toString());
                        final weatherName =
                            data["list"][index + 1]["weather"][0]["main"];

                        return WeatherCard(
                          time: DateFormat.j().format(time),
                          icon: weatherName == "Clouds" || weatherName == "Rain"
                              ? Icons.cloud
                              : Icons.sunny,
                          tem: data["list"][index + 1]["main"]["temp"]
                              .toString(),
                        );
                      }),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherItem(
                      label: "Humidity",
                      icon: Icons.water_drop,
                      value: speed.toString(),
                    ),
                    WeatherItem(
                      label: "Wind Speed",
                      icon: Icons.air,
                      value: humidity.toString(),
                    ),
                    WeatherItem(
                      label: "Pressure",
                      icon: Icons.beach_access,
                      value: pressure.toString(),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
