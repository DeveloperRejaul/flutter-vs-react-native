import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/future_provider/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_provider.g.dart';

@riverpod
Future<User> getUser(GetUserRef ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.getUser();
}

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUserProvider).when(
      data: (data) {
        return Center(
          child: Text(data.name),
        );
      },
      error: (error, stack) {
        return Text("Error ");
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
