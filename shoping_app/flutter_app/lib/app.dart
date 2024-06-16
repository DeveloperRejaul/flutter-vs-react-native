import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFAFAFAFA),
          background: Colors.white,
          primary: Colors.blue[50],
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
