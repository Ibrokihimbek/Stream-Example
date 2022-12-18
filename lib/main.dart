import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_example/screens/app_router.dart';
import 'package:stream_example/view_models/counter_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutName.main,
      onGenerateRoute: AppRoutes.generateRoute,
      title: 'Stream Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
