import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String time;
  final String tem;
  final IconData icon;

  const WeatherCard(
      {super.key, required this.time, required this.tem, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Icon(icon, size: 32),
            const SizedBox(height: 10),
            Text(tem),
          ],
        ),
      ),
    );
  }
}
