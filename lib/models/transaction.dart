import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categorieIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Transaction({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  String get formattedDate => formatter.format(date);
}

class TransactionBucket {
  const TransactionBucket({
    required this.category,
    required this.transactions,
  });

  final Category category;
  final List<Transaction> transactions;
  
  //factory constructor for filtering transaction per category
  TransactionBucket.forCategory(
      List<Transaction> allTransactions, this.category)
      : transactions = allTransactions
            .where((transaction) => transaction.category == category)
            .toList();

  double get totalTransactions {
    double sum = 0;

    for (final transaction in transactions) {
      sum += transaction.amount;
    }
    return sum;
  }
}
