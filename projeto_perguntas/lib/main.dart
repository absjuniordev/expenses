import 'package:flutter/material.dart';
import 'package:projeto_perguntas/perguntas.dart';
import 'questao.dart';

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
      'respostas': ['Preta', 'Vermelho', 'Branco', 'Verde']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Pato', 'Leão', 'Ovelha']
    },
    {
      'texto': 'Qual é o seu time favorito?',
      'respostas': ['Vitoria', 'Vasco', 'Bahia', 'Palmeiras']
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
    // void Function() perguntaRespondida() {
    //   return () {
    //     print("Pergunta respondida #2");
    //   };
    // }

    // Lista para Widgets #01 e #02
    List respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];
    //Evolução 02
    // List<Widget> widgets = respostas
    // .map((e) => Respostas(
    //       text: e,
    //       onPressed: responder,
    //     ))
    // .toList();

    // for (var textResposta in respostas) {
    //   widgets.add(Respostas(
    //     text: textResposta,
    //     onPressed: responder,
    //   ));
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(
                    //indice e a chave
                    text: _perguntas[_perguntaSelecionada]['texto'].toString(),
                  ),
                  //"..." spread
                  //Evolução 03
                  ...respostas
                      .map((e) => Respostas(text: e, onPressed: responder))
                      .toList(),

                  //resumo
                  //onPressed: responder() = manda um outro executar o serviço
                  //onPressed: responder = ele mesmo executa o serviço
                  // ElevatedButton(
                  //   child: const Text('Exemplo 1'),
                  //   onPressed: () {
                  //     // invocando a função
                  //     responder();
                  //   },
                  // ),
                  // ElevatedButton(
                  //   //passando a função como parametro
                  //   onPressed: perguntaRespondida(),
                  //   child: const Text('Exemplo 2'),
                  // ),
                  // ElevatedButton(
                  //   //passando uam função como parametro
                  //   onPressed: responder,
                  //   child: const Text('Exemplo 3'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     responder();
                  //   },
                  //   child: const Text('Exemplo 4'),
                  // ),
                ],
              )
            : null,
      ),
    );
  }
}
