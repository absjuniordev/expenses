// ignore_for_file: unnecessary_null_comparison

import 'package:expenses/components/adaptative_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(this.onSubmit, {super.key});

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() async {
    showDatePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AdaptativeTextField(
                label: 'Titulo',
                controller: _titleController,
                onSubimited: () => _submitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                onSubimited: () => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "Nenhuma data selecionada!"
                            : "Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}",
                      ),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: const Text("Selecionar Data"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Nova Transação ',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
