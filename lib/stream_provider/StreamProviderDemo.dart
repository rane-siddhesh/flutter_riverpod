import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/stream_provider/fake_stream_service.dart';

final tickProvider = StreamProvider((Ref ref) {
  final timerServiceAscyn = ref.read(timerServiceProvider);
  return timerServiceAscyn.tickWithError();
});

class StreamProviderDemo extends ConsumerWidget {
  const StreamProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickAsync = ref.watch(tickProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider")),
      body: Center(
        child: tickAsync.when(
          data: (time) => Text("Time Lapsed : $time", style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          error: (error, _) => Text("Error: ${error.toString()}"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
