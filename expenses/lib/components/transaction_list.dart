import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Expanded(
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Text(
                    "Nenhuma transação cadastrada",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              //Otimização , somente carregara o necesario
              //evitando gastos desnecesarios de memoria
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FittedBox(
                          child: Text("R\$ ${tr.value.toStringAsFixed(2)}"),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
