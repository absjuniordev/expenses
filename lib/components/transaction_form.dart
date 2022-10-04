import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit; //#4.1 - fica salvo

  TransactionForm(this.onSubmit,
      {super.key}); //#4.2 - depois é enviado ao construtror

  _submitForm() {
    //Função para trabalhar
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

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
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(labelText: 'Titulo'),
          ),
          TextField(
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Row(
            // formulario
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                onPressed: _submitForm,
                child: const Text('Nova Transação'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
