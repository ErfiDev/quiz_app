import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Text('Game page'),
    );
  }
}
