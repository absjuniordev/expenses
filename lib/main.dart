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
          labelLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
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
  final List<Transaction> _transaction = [];

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

  _addTransacton(String title, double value, DateTime date) {
    final newTranaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transaction.add(newTranaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transaction.removeWhere((tr) => tr.id == id);
    });
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
    final appBar = AppBar(
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
    );

    final availableHieght = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: availableHieght * 0.25,
              child: Chart(
                recentTransaction: _recentTransactions,
              ),
            ),
            SizedBox(
              height: availableHieght * 0.7,
              child: TransactionList(
                transactions: _transaction,
                onRemove: _removeTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}