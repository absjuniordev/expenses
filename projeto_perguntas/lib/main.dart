import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preta', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 8},
        {'texto': 'Branco', 'nota': 3},
        {'texto': 'Verde', 'nota': 6},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 9},
        {'texto': 'Pato', 'nota': 5},
        {'texto': 'Leão', 'nota': 7},
        {'texto': 'Ovelha', 'nota': 3},
      ]
    },
    {
      'texto': 'Qual é o seu time favorito?',
      'respostas': [
        {'texto': 'Vitoria', 'nota': 10},
        {'texto': 'Vasco', 'nota': 7},
        {'texto': 'Bahia', 'nota': 1},
        {'texto': 'Palmeiras', 'nota': 5},
      ]
    },
  ];

  responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
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
                responder: responder,
              )
            : const Resultado(),
      ),
    );
  }
}
