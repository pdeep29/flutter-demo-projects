import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets//new_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'shoes',
      amount: 5000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'groceries',
      amount: 20,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        // TransactionList(_userTransaction),
      ],
    );
  }
}
