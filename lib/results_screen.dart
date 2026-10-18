import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<AnswerSummary> get _summaryData {
    return chosenAnswers.indexed.map((entry) {
      final (index, userAnswer) = entry;

      return (
        questionIndex: index,
        question: questions[index].text,
        correctAnswer: questions[index].correctAnswer,
        userAnswer: userAnswer,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = _summaryData;
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data.userAnswer == data.correctAnswer)
        .length;

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Správne odpovede: $numCorrectAnswers z $numTotalQuestions',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 230, 200, 253),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(child: QuestionsSummary(summaryData)),
          const SizedBox(height: 30),
          Center(
            child: TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Reštartovať kvíz'),
            ),
          ),
        ],
      ),
    );
  }
}
