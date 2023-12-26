import 'dart:math';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
// import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
      title: "Conta de Energia",
      value: 210,
      date: DateTime.now(),
      id: 't3',
    ),
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransacton),
        TransactionList(transactions: _transaction),
      ],
    );
  }
}
