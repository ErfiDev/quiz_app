import 'package:flutter/material.dart';
import 'package:quiz_app/src/questions.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int? _numberOfQuestions;
  String? _selectedDifficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Settings'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(
            'Select questions difficulty:',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: DropdownButton<String>(
              value: _selectedDifficulty,
              items: [
                DropdownMenuItem(value: 'easy', child: Text('Easy')),
                DropdownMenuItem(value: 'medium', child: Text('Medium')),
                DropdownMenuItem(value: 'hard', child: Text('Hard')),
              ],
              onChanged: (v) {
                setState(() => _selectedDifficulty = v);
              },
              elevation: 2,
              icon: Icon(Icons.arrow_downward),
              hint: Text('Questions difficulty'),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Set number of questions:',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (v) {
                setState(() => _numberOfQuestions = int.tryParse(v));
              },
              decoration: InputDecoration(
                hintText: 'Number of questions',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_selectedDifficulty == null || _numberOfQuestions == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please containe all the fields before starting the game",
                    ),
                  ),
                );
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => QuestionPage(
                    difficulty: _selectedDifficulty!,
                    numberOfQuestions: _numberOfQuestions!,
                  ),
                ),
              );
            },
            child: Text('LETS PLAY'),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(16),
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }
}
