import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupTransactionsValues {
    return List.generate(7, (index) {
      double sum = 0.0;

      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      recentTransaction.forEach((element) {
        if (element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year) sum += element.amount;
      });

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupTransactionsValues.fold(0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionsValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionsValues
              .map(
                (data) => Flexible(
                  fit: FlexFit.tight,
                  child: Bar(
                      data['day'],
                      data['amount'],
                      maxSpending == 0.0 ? 0.0: (data['amount'] as double) / maxSpending),
                ),
        ).toList(),
        ),
      ),
    );
  }
}
