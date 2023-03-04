// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal ',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.brown, //Couleur de floatingBouttonBottom
        appBarTheme: const AppBarTheme(
          color: Colors.brown,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Quicksand',
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
   /* Transaction(
        id: 'T1', title: 'New iPhone', amount: 599.99, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'The Rent Bill', amount: 59.99, date: DateTime.now()),
    Transaction(
        id: 'T3', title: 'New t-shirt', amount: 29.99, date: DateTime.now()),
    Transaction(
        id: 'T4', title: 'Week Groceries', amount: 79.99, date: DateTime.now()),
        */
  ];

// Fonction d'ajout d'une transaction dans new transaction
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

// Fenetre de pop-up du formulaire Ajout Transaction
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Card(
                    child: Text('Card !'),
                  )),
             //  Personal Expenses
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Recent Expenses',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                ],
              ),
              TransactionList(_userTransactions),
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
