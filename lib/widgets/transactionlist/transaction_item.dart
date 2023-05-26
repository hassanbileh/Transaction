import 'package:flutter/material.dart';

import '../../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: const Color.fromARGB(255, 36, 102, 75)),
                  ),
                  child: Text(
                    '\$ ${transaction.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 36, 102, 75),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Icon(categorieIcons[transaction.category]),
                    Text(transaction.category.name),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(transaction.title,
                        style: Theme.of(context).appBarTheme.titleTextStyle),
                    Text(
                      transaction.formattedDate,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}