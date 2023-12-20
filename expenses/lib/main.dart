import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Text(
                      tr.value.toString(),
                    ),
                    Column(
                      children: [
                        Text(tr.title),
                        Text(tr.date.toString()),
                      ],
                    )
                  ],
                ));
              }).toList(),
            ],
          )
        ],
      ),
    );
  }
}
