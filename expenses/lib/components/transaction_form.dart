import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Titulo",
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text("Nova Transação"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
