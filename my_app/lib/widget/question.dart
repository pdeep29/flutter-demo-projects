import 'package:flutter/material.dart';
import './question_Text.dart';
import './answe.dart';

class Question extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int indexvalue;
  final Function changeQuestion;

  Question(
      {required this.questions,
      required this.changeQuestion,
      required this.indexvalue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              QuestionText(questions[indexvalue]['Question']),
              // Text(
              //   questions.elementAt(indexvalue),
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              ...(questions[indexvalue]['Answer'] as List<Map<String, Object>>)
                  .map((answer) {
                return Answer(() => changeQuestion(answer['Score']),
                    answer['text'] as String);
              }).toList(),
              // Text(questions.length),
            ],
          ),
        ),
      ],
    );
  }
}
