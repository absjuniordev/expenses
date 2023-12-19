import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preta', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 8},
        {'texto': 'Branco', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 6},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 9},
        {'texto': 'Pato', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 7},
        {'texto': 'Ovelha', 'pontuacao': 3},
      ]
    },
    {
      'texto': 'Qual é o seu time favorito?',
      'respostas': [
        {'texto': 'Vitoria', 'pontuacao': 10},
        {'texto': 'Vasco', 'pontuacao': 7},
        {'texto': 'Bahia', 'pontuacao': 1},
        {'texto': 'Palmeiras', 'pontuacao': 5},
      ]
    },
  ];

  responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
      pontuacaoTotal += pontuacao;
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: temPerguntaSelecionada
            ? null
            : FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _perguntaSelecionada = 0;
                  });
                },
                child: const Text("Retorne"),
              ),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                qundoResponder: responder,
              )
            : const Resultado(),
      ),
    );
  }
}
