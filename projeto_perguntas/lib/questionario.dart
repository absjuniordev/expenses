import 'package:flutter/material.dart';
import 'package:projeto_perguntas/perguntas.dart';
import 'package:projeto_perguntas/questao.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;
  const Questionario(
      {super.key,
      required this.perguntaSelecionada,
      required this.perguntas,
      required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: [
        Questao(
          text: perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        ...respostas
            .map((resp) =>
                Respostas(text: resp['texto'] as String, onPressed: responder))
            .toList(),
      ],
    );
  }
}
