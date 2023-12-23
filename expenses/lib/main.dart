import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transaction = [
    Transaction(
      title: "Novo Tenis",
      value: 310.76,
      date: DateTime.now(),
      id: 't1',
    ),
    Transaction(
      title: "Conta de Energia",
      value: 210,
      date: DateTime.now(),
      id: 't2',
    ),
    Transaction(
      title: "Conta de Agua",
      value: 85,
      date: DateTime.now(),
      id: 't3',
    ),
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Despesas Pessoais",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              elevation: 5,
              child: Text("Grafico"),
            ),
          ),
          Column(
            children: [
              ..._transaction.map((tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          "R\$ ${tr.value.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat(' d MMM y').format(tr.date),
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Titulo",
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
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
          )
        ],
      ),
    );
  }
}
