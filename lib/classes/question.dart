class Question {
  String question;
  String correctAnswer;
  List<dynamic> answers;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

  factory Question.FromJson(Map<String, dynamic> json) {
    List<dynamic> allAnswers = [];
    allAnswers.add(json['correct_answer']);
    allAnswers.addAll(json['incorrect_answers']);
    allAnswers.shuffle();

    return Question(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      answers: allAnswers,
    );
  }

  @override
  String toString() {
    return '$question $correctAnswer $answers';
  }
}
