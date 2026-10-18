import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void _answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    // Po poslednej odpovedi Quiz prepne na výsledky, index už nezvyšujeme.
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Otázka ${_currentQuestionIndex + 1} z ${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () => _answerQuestion(answer),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
