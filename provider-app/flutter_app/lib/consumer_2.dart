import 'package:flutter/material.dart';
import 'package:flutter_app/button.dart';
import 'package:flutter_app/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderApp2 extends StatefulWidget {
  const ProviderApp2({super.key});

  @override
  State<ProviderApp2> createState() => _ProviderApp2State();
}

class _ProviderApp2State extends State<ProviderApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<CounterProvider>(builder: (context, counter, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counter.counter.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(height: 10),
                Button(
                  text: "Increment",
                  onPress: counter.increment,
                ),
                const SizedBox(height: 10),
                Button(
                  text: "Decrement",
                  onPress: counter.decrement,
                ),
                const SizedBox(height: 10),
                Button(
                  text: "Increment with value",
                  onPress: () {
                    counter.incrementWithValue(5);
                  },
                ),
                const SizedBox(height: 10),
                Button(
                  text: 'Decrement With Value',
                  onPress: () {
                    counter.decrementWithValue(5);
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
