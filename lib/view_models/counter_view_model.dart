import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_example/data/stream_generator.dart';

class CounterViewModel extends ChangeNotifier {
  
  //!--------------------------------- 1 - screen ---------------------------!//

  int numberFirst = 0;

  degreeNumber(int number) {
    numberFirst = number * number;
    notifyListeners();
  }

  //!--------------------------------- 2 - screen ---------------------------!//

  int numberLength = 0;

  lengtNumber(String number) {
    numberLength = number.length;
    notifyListeners();
  }

  //!--------------------------------- 3 - screen ---------------------------!//

  int counter = 0;
  late StreamSubscription subscription;

  listenNumbers(int number) {
    Stream<int> stream = StreamGenerator.getMyNumbers(number);
    subscription = stream.listen((event) {
      counter = event;
      notifyListeners();
    });
  }

  pauseCounterStream() => subscription.pause();

  resumeCounterStream() => subscription.resume();

  cancelCounterStream() => subscription.cancel();
}
