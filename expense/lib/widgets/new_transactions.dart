import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  dynamic selectedDate;

  void submitData(BuildContext context) {
    print('amountController.text ${amountController.text.length}');
    final enteredTitle = titleController.text;
    final enteredAmmount = amountController.text.length > 0
        ? double.parse(amountController.text)
        : 0;

    if (enteredTitle.isEmpty || enteredAmmount <= 0 || selectedDate == null) {
      print('entered number or tet not valid');
      return;
    } else {
      widget.addTransaction(titleController.text,
          double.parse(amountController.text), selectedDate);
      Navigator.of(context).pop();
    }
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(
        () {
          selectedDate = value;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mode = MediaQuery.of(context).orientation == Orientation.landscape;
    return SingleChildScrollView(
      child: Card(
        child: Container(
        
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (value) => titleInput = value,
                controller: titleController,
                onSubmitted: (_) => submitData(context),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // onChanged: (amount) => amountInput = amount,
                controller: amountController,
                onSubmitted: (_) => submitData(context),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(selectedDate == null
                          ? 'NO DATE CHOSEN!'
                          : DateFormat.yMd().format(selectedDate)),
                    ),
                    TextButton(
                      child: const Text('Chose Date'),
                      onPressed: presentDatePicker,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => submitData(context),
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
