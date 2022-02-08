import 'package:flutter/material.dart';
import '../widget/question.dart';
import '../widget/display_output.dart';

class QuestionScreenState extends StatefulWidget {
  const QuestionScreenState({Key? key}) : super(key: key);
  static const routeName = '/question-screen';
  @override
  State<QuestionScreenState> createState() => QuestionScreen();
}

class QuestionScreen extends State<QuestionScreenState> {
  var questions = [
    {
      'Question': 'What is Your Favorite color?',
      'Answer': [
        {'text': 'red', 'Score': 20},
        {'text': 'black', 'Score': 30},
        {'text': 'blue', 'Score': 15},
        {'text': 'green', 'Score': 10}
      ]
    },
    {
      'Question': 'What is Your Favorite Activity?',
      'Answer': [
        {'text': 'cycling', 'Score': 10},
        {'text': 'treaking', 'Score': 15},
        {'text': 'reading', 'Score': 20},
        {'text': 'dancing', 'Score': 30}
      ]
    },
    {
      'Question': 'What is Your Favorite Game?',
      'Answer': [
        {'text': 'cricket', 'Score': 10},
        {'text': 'football', 'Score': 20},
        {'text': 'rugby', 'Score': 25},
        {'text': 'chess', 'Score': 30},
      ]
    },
    {
      'Question': 'What is Your Favorite place for Travelling?',
      'Answer': [
        {'text': 'beach', 'Score': 10},
        {'text': 'mountains', 'Score': 15},
        {'text': 'waterpark', 'Score': 20}
      ]
    },
  ];
  int indexvalue = 0;
  int totalScore = 0;
  bool maxLength = false;
  void changeQuestion(int score) {
    setState(() {
      indexvalue = indexvalue + 1;
      totalScore = totalScore + score;
    });
  }

  void resetTest() {
    setState(() {
      indexvalue = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(questions.length);
    return Scaffold(
      appBar: AppBar(),
      body: indexvalue < questions.length
          ?
          // Column(
          //     children: <Widget>[
          //       Padding(
          //         padding:
          //             const EdgeInsets.only(left: 20, top: 10, right: 20),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: <Widget>[
          //             QuestionText(questions[indexvalue]['Question']),
          //             // Text(
          //             //   questions.elementAt(indexvalue),
          //             //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //             // ),
          //             ...(questions[indexvalue]['Answer']
          //                     as List<Map<String, Object>>)
          //                 .map((answer) {
          //               return Answer(() => changeQuestion(answer['Score']),
          //                   answer['text'] as String);
          //             }).toList(),
          //             // Text(questions.length),
          //           ],
          //         ),
          //       ),

          //     ],
          //   )
          Question(
              questions: questions,
              changeQuestion: changeQuestion,
              indexvalue: indexvalue,
            )
          :
          // Center(
          //     child: Column(
          //       children: <Widget>[
          //         Text(
          //           'Total Score is $totalScore',
          //           style: const TextStyle(
          //               fontSize: 18, fontWeight: FontWeight.bold),
          //         ),
          //         ElevatedButton(
          //           child: const Text('Reset Test'),
          //           onPressed: resetTest,
          //         ),
          //       ],
          //     ),
          //   )
          DisplayOutpuot(totalScore: totalScore, resetTest: resetTest),
    );
  }
}
