import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  const Resultado({
    Key? key,
    required this.pontuacao,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns";
    } else if (pontuacao < 12) {
      return "Você é Bom2";
    } else if (pontuacao < 16) {
      return "Impressionate";
    } else {
      return "Nivel Jedi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
