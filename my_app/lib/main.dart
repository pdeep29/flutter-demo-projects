import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_screen.dart';
// import './screens/dashboard_screen.dart';
import './screens/movie_details_screen.dart';
import './screens/question_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo',
    home: TestPage(),
    debugShowCheckedModeBanner: false,
  ));
}

printStatement() {
  print('pressed the settings');
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        // scaffoldBackgroundColor: Colors.white,
      ),
      home: DashboardScreen(),
      routes: {
        MovieDetailsScreen.routeName: (ctxt) => MovieDetailsScreen(),
        QuestionScreenState.routeName: (ctxt) => QuestionScreenState(),
      },
    );
  }
}
