import 'package:Flutter_Riverpod/todo/ToDoNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoDemo extends ConsumerStatefulWidget {
  const ToDoDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ToDoDemoState();
  }
}

class _ToDoDemoState extends ConsumerState<ToDoDemo> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);
    return Scaffold(
      appBar: AppBar(title:  Text("ToDo Tutorial"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: InputDecoration(label: Text('Title')),)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){
                  todoNotifier.add(_controller.text);
                  _controller.clear();
                }, icon: Icon(Icons.add))
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(itemCount: todos.length, itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(value: false, onChanged: (_) => null),
                  title: Text(todos[index].title),
                  trailing: IconButton(onPressed: (){
                    todoNotifier.remove(todos[index].id);
                  }, icon: Icon(Icons.delete))
                );
              }),
            )
          ],
        ),
      ),
    );
  }
  
}
