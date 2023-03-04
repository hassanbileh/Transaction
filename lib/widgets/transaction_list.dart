// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // ListView with 300px of height
        child: transactions.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'No Transaction added yet',
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      height: 150,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColorLight),
                          ),
                          child: Text(
                            '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(transactions[index].title,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle),
                            Text(
                              DateFormat.yMMMMd("en_US")
                                  .format(transactions[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    elevation: 7,
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
