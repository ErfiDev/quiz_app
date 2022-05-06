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
  int _currentQuestion = 0;

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
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Image(image: AssetImage('images/1.png')),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            _questions[_currentQuestion].question,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: GridView.builder(
                              itemCount:
                                  _questions[_currentQuestion].answers.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 70,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Center(
                                    child: Text(
                                      _questions[_currentQuestion]
                                          .answers[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.4,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
