import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit; //#4.1 - fica salvo

  TransactionForm(this.onSubmit,
      {super.key}); //#4.2 - depois é enviado ao construtror

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
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                onPressed: () {
                  final title = titleController.text;
                  final value = double.tryParse(valueController.text) ?? 0.0;
                  onSubmit(title, value); //#1
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
