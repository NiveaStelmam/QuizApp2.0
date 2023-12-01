import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.white, // cor do fundo do app - Color(0xFF4A0975)
        appBar: AppBar(
          backgroundColor: Color(0xFF4A0975), // cor da barra de navegação
          title: Center(child: Text('Quiz - Legislação e Ética em TI')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionando');
                      Navigator.pushNamed(context, 'game_screen');
                    },
                    child: Text('Jogar', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4A0975), // cor do botão
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
