import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProviderDemo extends ConsumerWidget{
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final str = ref.watch(staticProvide);
    final age = ref.watch(intProvide);
    final mobile = ref.watch(mobileProvide);
    return Scaffold(
      appBar: AppBar(title: Text("Provider Basic"),),
      body: Center(
        child: Text("$str age: $age and mobile: $mobile"),
      ),
    );
  }

}

final staticProvide = Provider((Ref ref) {
  return "Siddhesh Digambar Rane";
});

final intProvide = Provider((Ref ref) {
  return 33;
});

final mobileProvide = Provider((Ref ref) {
  return 8655569774;
});