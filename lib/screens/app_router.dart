import 'package:flutter/material.dart';
import 'package:stream_example/screens/main/main_page.dart';
import 'package:stream_example/screens/second_screen/second_page.dart';
import 'package:stream_example/screens/third_screen/third_page.dart';

import 'first_screen/first_page.dart';

abstract class RoutName {
  static const main = 'main';
  static const first = 'first';
  static const second = 'second';
  static const third = 'third';
  static const changedSize = 'changedSize';
  static const flexible = 'flexible';
  static const indicator = 'indicator';
  static const border = 'border';
  static const flashChat = 'flashChat';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case RoutName.third:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ThirdScreenPage(
            number: args['number'],
          ),
        );
      case RoutName.first:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => FirstScreenPage(
            number: args['number'],
          ),
        );
      case RoutName.second:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SecondScreenPage(
            number: args['number'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
