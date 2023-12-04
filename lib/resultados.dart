import 'package:flutter/material.dart';

class Argumentos {
  int acertos = 0;
  Argumentos(this.acertos);
}

class Resultado extends StatelessWidget {
  static const routeName = 'Resultado';

  const Resultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                Text("Resultado", style: TextStyle(fontSize: 20)),
                Center(
                  child: Text(
                      "Você acertou\n${argumentos.acertos} de 10\nperguntas ",
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado');

                      Navigator.pushNamed(context, 'game_screen');
                    },
                    child:
                        Text('Jogar Novamente', style: TextStyle(fontSize: 30)),
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
