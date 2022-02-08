import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final dynamic questionText;
  QuestionText(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
