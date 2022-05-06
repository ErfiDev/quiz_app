import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/classes/question.dart';

Widget GetQuestionCard(
    Question question, Function next, Function rightAndNext) {
  int randomInt = Random().nextInt(9) + 1;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        flex: 5,
        child: Image(image: AssetImage('images/$randomInt.png')),
      ),
      SizedBox(height: 20),
      Expanded(
        flex: 6,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: question.answers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        if (question.correctAnswer == question.answers[index]) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Correct Answer'),
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.greenAccent,
                            ),
                          );

                          rightAndNext();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Wrong Answer'),
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.redAccent,
                            ),
                          );

                          next();
                        }
                      },
                      child: Text(
                        question.answers[index],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
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
  );
}
