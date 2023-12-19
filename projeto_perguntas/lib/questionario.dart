import 'package:flutter/material.dart';
import 'package:projeto_perguntas/perguntas.dart';
import 'package:projeto_perguntas/questao.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) qundoResponder;
  const Questionario(
      {super.key,
      required this.perguntaSelecionada,
      required this.perguntas,
      required this.qundoResponder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Questao(
          text: perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        ...respostas.map((resp) {
          return Respostas(
            text: resp['texto'].toString(),
            onPressed: () => qundoResponder(
              int.parse(
                resp['pontuacao'].toString(),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
