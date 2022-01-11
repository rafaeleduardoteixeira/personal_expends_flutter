import 'package:flutter/material.dart';
import 'package:personal_expends/models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onDelete;

  TransactionList(this.transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'Nenhuma transação cadastrada!',
                    style: TextStyle(fontSize: 18),
                  )),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onDelete(transaction.id),
                    color: Colors.red,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(child: Text('R\$${transaction.value}')),
                    ),
                  ),
                  title: Text(transaction.title),
                  subtitle:
                      Text(DateFormat('d MMM y').format(transaction.date)),
                ),
              );
            },
          );
  }
}
