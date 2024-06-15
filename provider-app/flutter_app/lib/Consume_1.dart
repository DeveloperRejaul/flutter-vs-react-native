import 'package:flutter/material.dart';
import 'package:flutter_app/button.dart';
import 'package:flutter_app/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderApp extends StatefulWidget {
  const ProviderApp({super.key});

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  Widget build(BuildContext context) {
    // get state way 01
    final counterState = Provider.of<CounterProvider>(context);

    // get state way 02
    // final counter = context.watch<CounterProvider>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // way 01
                // counterState.counter.toInt().toString(),

                // way 02,
                // counter.counter.toInt().toString()

                // way 03
                context.read<CounterProvider>().counter.toInt().toString(),

                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Button(
                  text: "Increment",
                  onPress: () {
                    // way 01
                    counterState.increment();

                    // way 02
                    // counter.increment();
                  }),
              const SizedBox(height: 10),
              Button(
                text: "Decrement",
                onPress: () {
                  // way 01
                  counterState.decrement();

                  // way 02
                  // counter.decrement();
                },
              ),
              const SizedBox(height: 10),
              Button(
                text: "Increment with value",
                onPress: () {
                  // way 01
                  counterState.incrementWithValue(5);

                  // way 02
                  // counter.incrementWithValue(5.0);
                },
              ),
              const SizedBox(height: 10),
              Button(
                text: 'Decrement With Value',
                onPress: () {
                  // way 01
                  counterState.decrementWithValue(5);

                  // way 02
                  // counter.decrementWithValue(5.0);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
