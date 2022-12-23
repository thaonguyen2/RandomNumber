import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  const RandomizerPage({
    super.key,
    required this.min,
    required this.max,
  });

  final int min;
  final int max;

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final _randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          _generatedNumber?.toString() ?? 'Generate a number',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _generatedNumber = widget.min +
                  _randomGenerator.nextInt(widget.max + 1 - widget.min);
            });
          },
          label: const Text('Generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
