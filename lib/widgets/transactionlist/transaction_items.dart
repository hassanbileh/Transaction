import 'package:flutter/material.dart';
import 'package:transaction/widgets/transactionlist/transaction_item.dart';

import '../../models/transaction.dart';

class TransactionItems extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(Transaction) onRemoveTransaction;

  const TransactionItems(
      {super.key,
      required this.transactions,
      required this.onRemoveTransaction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(transactions[index]),
          background: Container(color: Theme.of(context).colorScheme.error,),
          onDismissed: (direction) {
            onRemoveTransaction(transactions[index]);
          },
          child: TransactionItem(transaction: transactions[index],),
        );
      },
    );
  }
}
