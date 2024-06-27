import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// create a provider and pass primitive data
/// this provider value we can't change
/// just read this value
///*
final provider = Provider<String>((ref) => "Hello World");
final provider2 = Provider<String>((ref) {
  return "I am provider 2";
});

//TODO:way 01 - with extends consumer widget class;
/* class ProviderExample extends ConsumerWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String message = ref.watch(provider);

    // create one time reading listener for optimize
    final String message2 = ref.read(provider2);

    return Center(
      child: Text("$message // $message2"),
    );
  }
}*/

//TODO:way 02 - with  Consumer widget; for optimize rendaring;
class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        builder: (context, ref, child) {
          final String message = ref.watch(provider);

          // create one time reading listener for optimize
          final String message2 = ref.read(provider2);
          return Text("$message // $message2");
        },
      ),
    );
  }
}
