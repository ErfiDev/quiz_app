import 'package:flutter/material.dart';
import 'package:quiz_app/classes/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/src/question_card.dart';
import 'package:quiz_app/src/result.dart';

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
  List<Question> _questions = [];
  int _currentQuestion = 0;
  int _score = 0;

  _QuestionPageState({
    required this.numberOfQuestions,
    required this.difficulty,
  });

  @override
  initState() {
    super.initState();
    _getQuestions();
  }

  _getQuestions() async {
    var apiUrl =
        'https://opentdb.com/api.php?amount=$numberOfQuestions&difficulty=$difficulty&type=multiple';
    var res = await http.get(Uri.parse(apiUrl));

    var jsonData = json.decode(res.body);
    for (var qu in jsonData['results']) {
      setState(() {
        _questions.add(Question.FromJson(qu));
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              score: _score,
              numberOfQuestions: _questions.length,
            ),
          ));
    }
  }

  void _rightAndNextQuestion() {
    setState(() {
      _score++;
    });

    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: _questions.length == 0
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: GetQuestionCard(
                _questions[_currentQuestion],
                _nextQuestion,
                _rightAndNextQuestion,
              ),
            ),
    );
  }
}
