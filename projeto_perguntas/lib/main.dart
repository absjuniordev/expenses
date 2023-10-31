import 'package:flutter/material.dart';
import 'package:projeto_perguntas/perguntas.dart';
import 'questao.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    // void Function() perguntaRespondida() {
    //   return () {
    //     print("Pergunta respondida #2");
    //   };
    // }

    final List<Map<String, Object>> _perguntas = [
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
    List respostas = [];
    for (var textResposta
        in _perguntas[perguntaSelecionada].cast()['respostas']) {
      respostas.add(Respostas(
        text: textResposta,
        onPressed: responder,
      ));
    }
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Perguntas"),
          ),
          body: Column(
            children: [
              Questao(
                  text: _perguntas[perguntaSelecionada]['texto'].toString()),
              ...respostas,

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
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
