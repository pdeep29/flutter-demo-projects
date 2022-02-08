import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constrains) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions Added Yet!',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (tx, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.subtitle1),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? ElevatedButton(
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
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
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                //             style: TextStyle(
                //               color: Theme.of(context).primaryColor,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //             )),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.subtitle1,
                //           ),
                //           Text(
                //             DateFormat.yMMMMd()
                //                 .format(transactions[index].date),
                //             style: TextStyle(
                //                 color: Theme.of(context).secondaryHeaderColor),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
              //     children: transactions.map((tx) {
              //   return Card(
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //           margin:
              //               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //               color: Colors.lightBlue,
              //               width: 2,
              //             ),
              //           ),
              //           padding: const EdgeInsets.all(10),
              //           child: Text(tx.amount.toString(),
              //               style: const TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20,
              //                   color: Colors.lightBlue)),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               tx.title,
              //               style: const TextStyle(
              //                   fontSize: 15, fontWeight: FontWeight.bold),
              //             ),
              //             Text(DateFormat.yMMMMd().format(tx.date),
              //                 style: TextStyle(color: Colors.grey)),
              //           ],
              //         )
              //       ],
              //     ),
              //   );
              // }).toList()
            ),
    );
  }
}
