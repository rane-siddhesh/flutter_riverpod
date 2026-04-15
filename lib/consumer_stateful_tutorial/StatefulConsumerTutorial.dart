import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final statefulProvider = StateProvider((Ref ref){
  return "";
});

class StatefulConsumerTutorial extends ConsumerStatefulWidget{
  const StatefulConsumerTutorial({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
   return _StatefulConsumerState();
  }

}

class _StatefulConsumerState extends ConsumerState<StatefulConsumerTutorial> {

  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.watch(statefulProvider.notifier).state = _controller.text;
    },);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var text = ref.watch(statefulProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Consumer Tutorial"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(controller: _controller,),
            SizedBox(height: 20,),
            Text("You typed: $text")
          ],
        ),
      ),
    );
  }

}