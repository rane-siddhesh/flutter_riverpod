import 'package:Flutter_Riverpod/state_notifier_controller/state_notifier_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierProviderDemo extends ConsumerWidget{
  const StateNotifierProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(stateCounterProvider);
    final ctrl = ref.read(stateCounterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("State Notifier Provider"),),
      body: Center(child: Text("$count", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){ctrl.increment();}, child: Icon(Icons.add),),
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: (){ctrl.decrement();}, child: Icon(Icons.remove),),
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: (){ctrl.reset();}, child: Icon(Icons.restart_alt),),
        ],
      ),
    );
  }

}