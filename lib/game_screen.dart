import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/quiz2.dart';

void main() {
  runApp(MaterialApp(
    home: GameScreen(),
  ));
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A0975),
        title: Text('Escolha o módulo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 100,
              child: ElevatedButton(
                child: Text('LGPD'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4A0975), // cor do botão
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 100,
              child: ElevatedButton(
                child: Text('Segurança da Informação'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4A0975), // cor do botão
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz2()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
