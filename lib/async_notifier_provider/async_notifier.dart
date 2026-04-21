import 'dart:async';

import 'package:Flutter_Riverpod/future_provider/FutureProviderDemo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingAsyncProvider = AsyncNotifierProvider<GreetingAsyncNotifier, String>(() => GreetingAsyncNotifier());

class GreetingAsyncNotifier extends AsyncNotifier<String>{
  @override
  FutureOr<String> build() async{
    return await ref.read(fakeApiProvider).callFakeApi();
  }

  Future<void> refresh() async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(fakeApiProvider).callFakeApi());

    /*try {
      state = AsyncValue.loading();
      final value = await ref.read(fakeApiProvider).callFakeApi();
      state = AsyncValue.data(value);
    }catch(e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }*/
  }

}