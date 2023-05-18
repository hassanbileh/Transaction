// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:transaction/widgets/no_transaction.dart';
import 'package:transaction/widgets/transaction_items.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions, required this.onRemoveTransaction});
  final List<Transaction> transactions;
  final void Function(Transaction) onRemoveTransaction;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        // ListView with 300px of height
        child: transactions.isEmpty ? NoTransaction(): TransactionItems(transactions: transactions, onRemoveTransaction: onRemoveTransaction,));
  }
}
