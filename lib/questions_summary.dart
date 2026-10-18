import 'package:flutter/material.dart';

typedef AnswerSummary = ({
  int questionIndex,
  String question,
  String correctAnswer,
  String userAnswer,
});

const _correctColor = Color.fromARGB(255, 150, 230, 160);
const _wrongColor = Color.fromARGB(255, 249, 133, 241);

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<AnswerSummary> summaryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: summaryData.map((data) {
          final isCorrect = data.userAnswer == data.correctAnswer;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: isCorrect ? _correctColor : _wrongColor,
                  child: Text(
                    '${data.questionIndex + 1}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 22, 2, 56),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.question,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Tvoja odpoveď: ${data.userAnswer}',
                        style: TextStyle(
                          color: isCorrect ? _correctColor : _wrongColor,
                        ),
                      ),
                      if (!isCorrect)
                        Text(
                          'Správna odpoveď: ${data.correctAnswer}',
                          style: const TextStyle(color: _correctColor),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
