import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String ansertTest;

  Answer(this.selectHandler, this.ansertTest);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(ansertTest),
        onPressed: selectHandler,
      ),
    );
  }
}
