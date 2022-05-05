import 'package:flutter/material.dart';
import 'package:quiz_app/classes/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          : ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (ctx, i) {
                return Text('${_questions[i].question}');
              },
            ),
    );
  }
}
