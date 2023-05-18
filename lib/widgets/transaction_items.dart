import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionItems extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(Transaction) onRemoveTransaction;

  const TransactionItems({super.key, required this.transactions, required this.onRemoveTransaction});
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(transactions[index]),
                    onDismissed: (direction) {
                      onRemoveTransaction(transactions[index]);
                    },
                    child: Card(
                      elevation: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
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
                          Text(transactions[index].category.name),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(transactions[index].title,
                                  style: Theme.of(context)
                                      .appBarTheme
                                      .titleTextStyle),
                              Text(
                                transactions[index].formattedDate,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
  }
}