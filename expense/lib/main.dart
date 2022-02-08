import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense/widgets/chart.dart';
// import 'package:flutter/services.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';

import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          secondaryHeaderColor: Colors.grey,
          errorColor: Colors.red.shade400,
          // accentColor: Colors.green,
          fontFamily: 'Quick',
          textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              toolbarTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      headline6: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 80,
                          fontWeight: FontWeight.bold))
                  .bodyText2,
              titleTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      headline6: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                  .headline6)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'shoes',
    //   amount: 5000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'groceries',
    //   amount: 20,
    //   date: DateTime.now(),
    // ),
  ];

  bool showChart = false;
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }
void didChangedAppLifeCycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get rectntTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: selectedDate);
    setState(() {
      transactions.add(newTx);
    });
  }

  late String titleInput;

  late String amountInput;

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandsacpe = mediaQuery.orientation == Orientation.landscape;

    // double height = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      title: Text(
        'Flutter App',
        style: Theme.of(context).appBarTheme.toolbarTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => startAddNewTransaction(context),
        )
      ],
    );
    final iosAppbar = CupertinoNavigationBar(
      middle: const Text('Expense Calculator'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: const Icon(CupertinoIcons.add_circled),
            onTap: () => startAddNewTransaction(context),
          )
        ],
      ),
    );
    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.730,
        child: TransactionList(transactions, deleteTransaction));
    final mainContent = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandsacpe)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'ShowChart',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Switch.adaptive(
                    activeColor: Theme.of(context).primaryColor,
                    value: showChart,
                    onChanged: (value) {
                      setState(
                        () {
                          showChart = value;
                        },
                      );
                    },
                  )
                ],
              ),
            if (!isLandsacpe)
              Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      // 0.7,
                      0.270,
                  child: Chart(rectntTransactions)),
            if (!isLandsacpe) txListWidget,
            if (isLandsacpe)
              showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      // 0.270,
                      child: Chart(rectntTransactions))
                  // Card(
                  //   child: Container(
                  //     padding: EdgeInsets.all(10),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.end,
                  //       children: <Widget>[
                  //         TextField(
                  //           decoration: InputDecoration(labelText: 'Title'),
                  //           onChanged: (value) => titleInput = value,
                  //         ),
                  //         TextField(
                  //           decoration: InputDecoration(labelText: 'Amount'),
                  //           onChanged: (amount) => amountInput = amount,
                  //         ),
                  //         TextButton(
                  //           onPressed: () {
                  //             print(titleInput);
                  //             print(amountInput);
                  //           },
                  //           child: Text(
                  //             'Add Transaction',
                  //             style: TextStyle(color: Colors.lightBlue),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // UserTransactions(),
                  : txListWidget
            // Column(
            //     children: transactions.map((tx) {
            //   return Card(
            //     child: Row(
            //       children: <Widget>[
            //         Container(
            //           margin: const EdgeInsets.symmetric(
            //               vertical: 10, horizontal: 15),
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
            // }).toList()),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: mainContent,
            navigationBar: iosAppbar,
          )
        : Scaffold(
            appBar: appBar,
            body: mainContent,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () => startAddNewTransaction(context),
                  ),
          );
  }
}
