import 'package:flutter/material.dart';
import 'package:learn_riverpod/provider/provider.dart';
import 'package:learn_riverpod/state_notifier_and_state_notifier_provider/state_notifier_and_state_notifier_provider.dart';
import 'package:learn_riverpod/state_provider/state_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProviderExample(),
            StateProviderExample(),
            StateNotifierAndStateNotifierProviderExample(),
          ],
        ),
      ),
    );
  }
}
