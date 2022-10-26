import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';
import './adaptative_button.dart';
import './adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});
  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  //#4.2 - depois é enviado ao construtror
  _submitForm() {
    //Função para trabalhar
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          //Apropiado para envolver
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(children: [
            AdaptativeTextField(
              label: 'Título',
              controller: _titleController,
              onSubmitted: (_) => _submitForm,
            ),
            AdaptativeTextField(
              label: 'Valor (r\$)',
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(),
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                }),
            Row(
              // formulario
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                  'Nova Transação',
                  _submitForm,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
