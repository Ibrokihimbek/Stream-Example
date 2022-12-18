class StreamGenerator {
  static Stream<int> getMyNumbers(int number) async* {
    for (int i = 1; i <= number; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
