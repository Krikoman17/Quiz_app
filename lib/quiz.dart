import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

enum ActiveScreen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeScreen = ActiveScreen.start;
  var _selectedAnswers = <String>[];

  void _startQuiz() {
    setState(() {
      _activeScreen = ActiveScreen.questions;
    });
  }

  void _chooseAnswer(String answer) {
    setState(() {
      _selectedAnswers.add(answer);

      if (_selectedAnswers.length == questions.length) {
        _activeScreen = ActiveScreen.results;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = ActiveScreen.questions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = switch (_activeScreen) {
      ActiveScreen.start => StartScreen(_startQuiz),
      ActiveScreen.questions => QuestionsScreen(onSelectAnswer: _chooseAnswer),
      ActiveScreen.results => ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: _restartQuiz,
      ),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(child: screenWidget),
        ),
      ),
    );
  }
}
