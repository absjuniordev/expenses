import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        //Apropiado para envolver
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Titulo'),
          ),
          TextField(
            controller: valueController,
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Row(
            // formulario
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  print(titleController.text);
                  print(valueController.text);
                },
                child: const Text('Nova Transação'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
