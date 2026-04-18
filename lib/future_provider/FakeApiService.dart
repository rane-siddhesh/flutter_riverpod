import 'dart:math';

class FakeApiService {

  Future<String> callFakeApi() async{
    await Future.delayed(const Duration(seconds: 2));
    final value = Random().nextDouble();
    print("APi value : $value" );
    if(value < 0.3) {
      throw Exception("Something went wrong.");
      //return "Something went wrong.";
    }

    return "Api called successfully";
  }
}