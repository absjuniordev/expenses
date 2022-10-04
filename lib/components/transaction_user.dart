import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de #01',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de #02',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta de #03',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta de #04',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta de #05',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Conta de #06',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransations(String title, double value) {
    //#4
    final newTransation = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransation); //#5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransations), //(Passa uma função para receber dados
        TransactionList(
            _transactions), //#2 - é chamado para mostrar tudo que contem salvo em '_transactions'
        //)#3 - fica ocioso aguardando a adção
      ],
    );
  }
}
