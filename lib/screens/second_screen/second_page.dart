import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_example/view_models/counter_view_model.dart';

class SecondScreenPage extends StatefulWidget {
  final String number;
  const SecondScreenPage({super.key, required this.number});

  @override
  State<SecondScreenPage> createState() => _SecondScreenPageState();
}

class _SecondScreenPageState extends State<SecondScreenPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CounterViewModel>(context, listen: false)
        .lengtNumber(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2 - screen"),
      ),
      body: Consumer<CounterViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.number,
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 18),
                Center(
                  child: Text(
                    '${viewModel.numberLength} ta',
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
