import 'package:flutter/material.dart';
import 'package:quiz_app/src/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.blueGrey[900],
        primaryColor: Colors.blueGrey[800],
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
