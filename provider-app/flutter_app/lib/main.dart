import 'package:flutter/material.dart';
import 'package:flutter_app/Consume_1.dart';
import 'package:flutter_app/consumer_2.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/provider/counter_provider.dart';

void main() {
  runApp(
    // single provider
    /* ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ), */

    // malty provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProviderApp2());
  }
}
