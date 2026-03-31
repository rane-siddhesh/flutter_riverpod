import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class StateProviderDemo extends ConsumerWidget {
  const StateProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("inside build");
    return Scaffold(
      appBar: AppBar(title: Text("StateProvider Demo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        backgroundColor: Colors.deepPurple,
        shape: OvalBorder(eccentricity: 0.5),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child){
            final counter = ref.watch(counterProvider);
            return Text(
              counter.toString(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            );
          }
        ),
      ),
    );
  }
}

final counterProvider = StateProvider((Ref ref) {
  return 0;
});
