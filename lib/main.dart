import 'package:flutter/material.dart';
import 'package:quiz/game_screen.dart';
import 'package:quiz/quiz2.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';

void main() {
  //runApp(Resultado(acertos: 3));
  //runApp(Quiz());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'Homepage', routes: {
      '/': (context) => Homepage(),
      'Quiz': (context) => Quiz(),
      'Quiz2': (context) => Quiz2(),
      'game_screen': (context) => GameScreen(),
      Resultado.routeName: (context) => Resultado(),
    });
  }
}
