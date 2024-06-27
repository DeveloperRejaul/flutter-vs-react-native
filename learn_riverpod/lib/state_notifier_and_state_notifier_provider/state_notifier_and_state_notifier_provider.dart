import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/state_notifier_and_state_notifier_provider/user.dart';

// create a new state Provider using StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) {
    return UserNotifier(const User(name: "Kamal Mia", age: 20));
  },
);

class StateNotifierAndStateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierAndStateNotifierProviderExample({super.key});

  void handleUser(WidgetRef ref) {
    ref.read(userProvider.notifier).updateName("New Name");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Center(
        child: Column(
      children: [
        Text(user.name),
        TextButton(
          onPressed: () => handleUser(ref),
          child: const Text("Change Name"),
        )
      ],
    ));
  }
}
