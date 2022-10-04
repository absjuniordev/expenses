import 'package:flutter/material.dart';
import './components/transaction_user.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Despesas Pessoais'),
          actions: [
            IconButton(
              //Criação do botão superior
              icon: const Icon(Icons.add),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
        //Funcção para rolar os itens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Grafico'),
            ),
            TransactionUser(), //#1 - contem as funcões excenciais
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Criação do botão inferior
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
