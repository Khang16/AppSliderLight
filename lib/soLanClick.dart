import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: _incrementCounter,
          child: const Text('Tang 1'),
        ),
        TextButton(
          onPressed: _decrementCounter,
          child: const Text('Giam 1'),
        ),
        TextButton(
          onPressed: _resetCounter,
          child: const Text('Reset'),
        ),
        Text('$_counter'),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
}
