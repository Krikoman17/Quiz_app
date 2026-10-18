class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;

  /// Prvá odpoveď v zozname je vždy tá správna.
  final List<String> answers;

  String get correctAnswer => answers.first;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
