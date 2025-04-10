import 'package:flutter/material.dart';
import'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var tx in recentTransactions) {
        
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount; 
        }
      }
      print(DateFormat.E(weekDay));
      print(totalSum);

      return {'day': DateFormat.E(weekDay), 'amount': totalSum};
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: <Column>[

        ],
      ),
    );
  }
}