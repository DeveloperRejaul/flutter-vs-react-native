import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// we can change this data like state;
final stateProvider = StateProvider<String>((ref) => "Hello world");

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  void handleChangeState(WidgetRef ref) {
    ref.read(stateProvider.notifier).update((state) => "Hello World 2");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(stateProvider);

    return Center(
      child: Column(
        children: [
          Text(message),
          TextButton(
            onPressed: () => handleChangeState(ref),
            child: const Text("Change State"),
          )
        ],
      ),
    );
  }
}
