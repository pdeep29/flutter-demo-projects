import 'package:flutter/material.dart';

class DisplayOutpuot extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetTest;

  DisplayOutpuot({required this.totalScore, required this.resetTest});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Total Score is $totalScore',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            child: const Text('Reset Test'),
            onPressed: resetTest,
          ),
        ],
      ),
    );
  }
}
