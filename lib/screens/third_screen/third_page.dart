import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_example/view_models/counter_view_model.dart';

class ThirdScreenPage extends StatefulWidget {
  final int number;
  const ThirdScreenPage({Key? key, required this.number}) : super(key: key);

  @override
  State<ThirdScreenPage> createState() => _ThirdScreenPageState();
}

class _ThirdScreenPageState extends State<ThirdScreenPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<CounterViewModel>(context, listen: false)
        .listenNumbers(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3 - screen"),
      ),
      body: Consumer<CounterViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    viewModel.counter.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterViewModel>().pauseCounterStream();
                  },
                  child: const Text(
                    "Pause Stream",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterViewModel>().resumeCounterStream();
                  },
                  child: const Text(
                    "Resume Stream",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterViewModel>().cancelCounterStream();
                  },
                  child: const Text(
                    "Cancel Stream",
                    style: TextStyle(fontSize: 28),
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
