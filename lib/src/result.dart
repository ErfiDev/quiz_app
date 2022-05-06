import 'package:flutter/material.dart';
import 'package:quiz_app/src/game_settings.dart';
import 'package:quiz_app/src/home.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int numberOfQuestions;

  const ResultPage(
      {Key? key, required this.score, required this.numberOfQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image(image: AssetImage('images/cup.png')),
            ),
            SizedBox(width: double.infinity, height: 20),
            Text(
              'You scored $score out of $numberOfQuestions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
                height: 2,
              ),
            ),
            ElevatedButton(
              child: Text(
                'Restart The Game',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Game(),
                    ),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
