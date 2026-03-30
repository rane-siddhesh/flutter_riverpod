import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final staticProvide = Provider((Ref ref) {
  return "Siddhesh Rane";
});

final intProvide = Provider((Ref ref) {
  return 33;
});

final mobileProvide = Provider((Ref ref) {
  return 8655569774;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final str = ref.watch(staticProvide);
    final age = ref.watch(intProvide);
    final mobile = ref.watch(mobileProvide);
    return MaterialApp(
      title: 'RiverPod Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: Text("$str age: $age and mobile: $mobile"),
        ),
      ),
    );
  }
}

