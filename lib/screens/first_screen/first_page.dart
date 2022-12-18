import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_example/view_models/counter_view_model.dart';

class FirstScreenPage extends StatefulWidget {
  final int number;
  const FirstScreenPage({super.key, required this.number});

  @override
  State<FirstScreenPage> createState() => _FirstScreenPageState();
}

class _FirstScreenPageState extends State<FirstScreenPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CounterViewModel>(context, listen: false)
        .degreeNumber(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1 - screen"),
      ),
      body: Consumer<CounterViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.number} sonining darajasi',
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 18),
                Center(
                  child: Text(
                    viewModel.numberFirst.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
