import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
    Transaction(
      title: "Novo Tenis",
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 3)),
      id: 't1',
    ),
    Transaction(
      title: "Conta de Energia",
      value: 210,
      date: DateTime.now().subtract(Duration(days: 4)),
      id: 't2',
    ),
    Transaction(
      title: "Academia",
      value: 120,
      date: DateTime.now().subtract(const Duration(days: 5)),
      id: 't3',
    ),
    Transaction(
      title: "Conta net",
      value: 210,
      date: DateTime.now().subtract(const Duration(days: 50)),
      id: 't4',
    ),
    Transaction(
      title: "Tablet",
      value: 1000,
      date: DateTime.now(),
      id: 't5',
    ),
    Transaction(
      title: "Pão",
      value: 2,
      date: DateTime.now(),
      id: 't6',
    ),
  ];

  ///Retornara verdadeiro para cada item dentro de 7 dias
  List<Transaction> get _recentTransactions {
    return _transaction.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransacton(String title, double value) {
    final newTranaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTranaction);
    });
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return TransactionForm(_addTransacton);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Despesas Pessoais",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(
              recentTransaction: _recentTransactions,
            ),
            //  SizedBox(
            //     child: Card(
            //       elevation: 5,
            //       child: Text("Grafico"),
            //     ),
            //     ),
            TransactionList(transactions: _transaction),
          ],
        ),
      ),
    );
  }
}
