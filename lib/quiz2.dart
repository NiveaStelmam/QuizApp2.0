import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';
import 'data2.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({Key? key, this.quiz = const []}) : super(key: key);

  final List quiz;

  @override
  State<Quiz2> createState() => _QuizState();
}

class _QuizState extends State<Quiz2> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    //quiz.shuffle(); // embaralhar a ordem das perguntas

    quiz.forEach((elemento) {
      int alternativaCorreta = elemento['alternativa_correta'];
      List respostas = elemento['respostas'];

      String respostaCorreta = elemento['respostas'][alternativaCorreta - 1];
      //print(respostaCorreta);

      respostas.shuffle();
      int i = 1;
      respostas.forEach((elemento) {
        if (elemento == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      elemento['alternativa_correta'] = alternativaCorreta;
    });

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          erros++;
        }

        print('acertos totais: $acertos erros totais: $erros');

        if (perguntaNumero == 10) {
          print('Terminou o Quiz');
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.white, // cor do fundo do app - Color(0xFF4A0975)
        appBar: AppBar(
          backgroundColor: Color(0xFF4A0975), // cor da barra de navegação -
          title: Center(child: Text('Quiz - Legislação e Ética em TI')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text("Questão $perguntaNumero/10")),
              Text("" + quiz[perguntaNumero - 1]['pergunta'],
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressionando  1");
                    respondeu(1);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][0],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4A0975), // cor do botão
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressionando  2");
                    respondeu(2);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][1],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A0975), // cor do botão
                      padding: const EdgeInsets.fromLTRB(100, 20, 100, 20)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressionando 3");
                    respondeu(3);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][2],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A0975), // cor do botão
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Pressionando 4");
                    respondeu(4);
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][3],
                      style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A0975), // cor do botão
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
