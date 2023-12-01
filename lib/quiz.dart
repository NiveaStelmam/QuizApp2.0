import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';
import 'data.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key, this.quiz = const []}) : super(key: key);

  final List quiz;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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

    /* for (int i = 3; i <= 20; i++) {
      quiz.add({
        "pergunta":
            "Em que ano a Lei Geral de Proteção de Dados entrou em vigor no Brasil?",
        "respostas": [
          "2018",
          "2020",
          "2021",
          "2022",
        ],
        "alternativa_correta": 2,
      });
      quiz.add({
        "pergunta":
            "Qual é o direito do titular dos dados de solicitar a eliminação de seus dados pessoais?",
        "respostas": [
          "Exclusão",
          "Anonimização",
          "Retenção",
          "Compartilhamento",
        ],
        "alternativa_correta": 1,
      });
      quiz.add({
        "pergunta":
            "Órgão da administração pública federal responsável por fiscalizar, regular e aplicar sanções em casos de violação da Lei Geral de Proteção de Dados:",
        "respostas": [
          "ANAC",
          "LGPD",
          "SFPD",
          "ANPD",
        ],
        "alternativa_correta": 4,
      });
      quiz.add({
        "pergunta":
            "O Marco Civil da Internet, oficialmente Lei n° 12.965 foi criada em que ano?",
        "respostas": [
          "2011",
          "2012",
          "2014",
          "2015",
        ],
        "alternativa_correta": 3,
      });
      quiz.add({
        "pergunta": "Quais são os 3 princípios do Marco Civil da Internet?",
        "respostas": [
          "Liberdade, Privacidade e Neutralidade",
          "Integridade, Autenticidade e Confidencialidade",
          "Disponibilidade, Confidencialidade e Autenticidade",
          "Disponibilidade, Neutralidade e Autenticidade",
        ],
        "alternativa_correta": 1,
      });
      quiz.add({
        "pergunta":
            "Processo de tornar os dados pessoais irreversivelmente anônimos, de forma que não possam ser associados a um indivíduo específico:",
        "respostas": [
          "Criptografia",
          "Mascaramento",
          "Anonimização",
          "Desidentificação",
        ],
        "alternativa_correta": 3,
      });
      quiz.add({
        "pergunta":
            "Qualquer informação que possa identificar um indivíduo, como nome, endereço, cpf e etc:",
        "respostas": [
          "Dados pessoais",
          "Informação",
          "Identificador",
          "Detalhamento",
        ],
        "alternativa_correta": 1,
      });
      quiz.add({
        "pergunta":
            "Pessoa ou empresa que coleta trata e armazena dados pessoais:",
        "respostas": [
          "Intermediário",
          "Supervisor de dados",
          "Controlador",
          "Tratador",
        ],
        "alternativa_correta": 3,
      });
      quiz.add({
        "pergunta":
            "Direito do titular de acessar seus próprios dados pessoais coletados e tratados pela empresa:",
        "respostas": [
          "Responsável",
          "Acesso",
          "Controle",
          "Gestão",
        ],
        "alternativa_correta": 2,
      });
    }

    print("Dados do Quiz");
    //print(quiz);
    //int perguntaNumero = 2;
*/
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
