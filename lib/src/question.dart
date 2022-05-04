import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final String difficulty;
  final int numberOfQuestions;

  QuestionPage({
    Key? key,
    required this.difficulty,
    required this.numberOfQuestions,
  }) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState(
        difficulty: difficulty,
        numberOfQuestions: numberOfQuestions,
      );
}

class _QuestionPageState extends State<QuestionPage> {
  final int numberOfQuestions;
  final String difficulty;

  _QuestionPageState({
    required this.numberOfQuestions,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Text('$numberOfQuestions $difficulty'),
    );
  }
}
