abstract class WebSecoketClient {
  Stream<int> getCounterStream({int start});
}

class FakeWebSocket implements WebSecoketClient {
  @override
  Stream<int> getCounterStream({int start=0}) async* {
    int i = start;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i++;
    }
  }
}
