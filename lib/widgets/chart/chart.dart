import 'package:flutter/material.dart';

import 'package:transaction/models/transaction.dart';
import 'package:transaction/widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.transactions});

  final List<Transaction> transactions;

  List<TransactionBucket> get buckets {
    return [
      TransactionBucket.forCategory(transactions, Category.food),
      TransactionBucket.forCategory(transactions, Category.leisure),
      TransactionBucket.forCategory(transactions, Category.travel),
      TransactionBucket.forCategory(transactions, Category.work),
    ];
  }

  double get maxTotalTransaction {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalTransactions > maxTotalExpense) {
        maxTotalExpense = bucket.totalTransactions;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalTransactions == 0
                        ? 0
                        : bucket.totalTransactions / maxTotalTransaction,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(
                        categorieIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}