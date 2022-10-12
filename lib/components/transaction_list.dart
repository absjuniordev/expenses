import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //equação ternaria para mostrar a imagem ou a lista
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  //definição de espaços
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              //' ListView.builder' definição dos elementos necessarios a serem exibidos -pouca memeoria do celular
              itemCount: transactions.length,
              //Tamanho
              itemBuilder: (ctx, index)
                  //Define o que sera mostrado - otimização
                  {
                final tr = transactions[index];
                return Card(
                  child: Row(
                    children: [
                      Container(
                        //Possibilidade de estilizar
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple, //pega a cor principal do thema
                          width: 2,
                        )),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //alinhamento
                        children: [
                          Text(
                            tr.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6, //#1 assume o estilo do 'title'
                            //#0 style: const TextStyle(
                            //     fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d/MMM/y').format(tr.date),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
