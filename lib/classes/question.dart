class Question {
  String question;
  String correctAnswer;
  List<dynamic> answers;

  Question(
    this.question,
    this.correctAnswer,
    this.answers,
  );

// take argument as a map of string dynamic
  factory Question.FromJson(Map<String, dynamic> json) {
    return Question(
      json['question'],
      json['correct_answer'],
      json['incorrect_answers'],
    );
  }

  @override
  String toString() {
    return '$question $correctAnswer $answers';
  }
}
