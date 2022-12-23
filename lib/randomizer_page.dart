import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      // body: Center(
      //   child: Text(
      //     context
      //             .watch<RandomizerChangeNotifier>()
      //             .generatedNumber
      //             ?.toString() ??
      //         'Generate a number',
      //     style: const TextStyle(fontSize: 32),
      //   ),
      // ),
      body: Center(child: Consumer<RandomizerChangeNotifier>(
        builder: (context, notifier, child) {
          return Text(
            notifier.generatedNumber?.toString() ?? 'Generate a number',
            style: const TextStyle(fontSize: 32),
          );
        },
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<RandomizerChangeNotifier>().generateRandomNumber();
          },
          label: const Text('Generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
