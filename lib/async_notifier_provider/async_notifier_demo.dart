import 'package:Flutter_Riverpod/async_notifier_provider/async_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNotifierDemo extends ConsumerWidget {
  const AsyncNotifierDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingAsyncProvider);
    final greetingAsyncNotifier = ref.read(greetingAsyncProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("Async Notifier Demo")),
      body: Center(
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (greeting) => Text(
            greeting,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          error: (e, _) =>
              Text("Error: $e", style: const TextStyle(color: Colors.red)),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: greetingAsyncNotifier.refresh,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
