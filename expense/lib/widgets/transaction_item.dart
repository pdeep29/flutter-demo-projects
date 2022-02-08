import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models//transaction.dart';

class Transaction_Item extends StatelessWidget {
  const Transaction_Item({
    Key? key,
    required this.transactions,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                '\$${transactions.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(transactions.title,
            style: Theme.of(context).textTheme.subtitle1),
        subtitle: Text(
          DateFormat.yMMMMd().format(transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? ElevatedButton(
                onPressed: () => deleteTransaction(transactions.id),
                child: Wrap(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                      size: 24.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Delete", style: TextStyle(fontSize: 20)),
                  ],
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(transactions.id),
              ),
      ),
    );
  }
}
