import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'components/transaction_list.dart';
import 'models/transaction.dart';
import './components/chart.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.purple) //cor do tema
                .copyWith(secondary: Colors.amber[700]), //cor do botão
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              //#2 opção para mudar as demais fontes
              titleLarge: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                titleLarge: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
              .headline6,
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
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        //isAfter == true or false
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransations(String title, double value, DateTime date) {
    //#4
    final newTransation = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(newTransation); //#5
    });

    Navigator.of(context).pop(); //Ocultar/Fechar/Desempilhar
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransations);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: const Text(
        'Despesas Pessoais',
      ),
      actions: [
        IconButton(
          //Criação do botão superior
          icon: const Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        )
      ],
    );
    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        //Funcção para rolar os itens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: availableHeight * 0.25,
              child: Chart(_recentTransactions),
            ),
            SizedBox(
              height: availableHeight * 0.75,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Criação do botão inferior
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
