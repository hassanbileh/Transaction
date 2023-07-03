import 'package:flutter/material.dart';
import 'package:transaction/widgets/chart/chart.dart';
import 'package:transaction/widgets/new_transaction.dart';
import 'package:transaction/widgets/transactionlist/transaction_list.dart';

import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

// Fonction d'ajout d'une instance de la classe transaction
  void _addNewTransaction(
      String txTitle, double txAmount, DateTime txDate, Category txCategory) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: txDate,
      category: txCategory,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransaction(Transaction transaction) {
    final transactionIndex = _userTransactions.indexOf(transaction);

    setState(() {
      _userTransactions.remove(transaction);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(
        seconds: 3,
      ),
      content: const Text('Transaction deleted'),
      backgroundColor: Colors.grey[800],
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _userTransactions.insert(transactionIndex, transaction);
          });
        },
      ),
    ));
  }

// Fenetre de pop-up du formulaire Ajout Transaction
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Chart(transactions: _userTransactions),
                ),
                //  Personal Expanses
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Recent Expenses',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TransactionList(
                    transactions: _userTransactions,
                    onRemoveTransaction: _removeTransaction,
                  ),
                ),
              ],
            )
          : Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Chart(transactions: _userTransactions),
                ),
                //  Personal Expanses
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Recent Expenses',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Expanded(
                        child: TransactionList(
                          transactions: _userTransactions,
                          onRemoveTransaction: _removeTransaction,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
