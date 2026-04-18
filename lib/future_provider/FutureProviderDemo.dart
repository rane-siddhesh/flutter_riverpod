import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/future_provider/FakeApiService.dart';

final fakeApiProvider = Provider((_) => FakeApiService());

final apiCallProvider = FutureProvider((Ref ref) async{
  final service = ref.read(fakeApiProvider);
  return await service.callFakeApi();
});

class FutureProviderDemo extends ConsumerWidget {
  const FutureProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiCallProvidr = ref.watch(apiCallProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider")),
      body: Center(
        child: apiCallProvidr.when(
          data: (greetings) =>
              Text(
                greetings,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          error: (error, stacktrace) {
            print("inside error");
              return Center(
                child: Column(children: [
                  Text(error.toString(), style: TextStyle(color: Colors.red),),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    // ref.refresh(apiCallProvider);
                  }, child: Text("Retry"))
                ],),
              );
          },
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
