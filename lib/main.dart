import 'package:expense_planner/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Container(
                  child: Text('Chart!'),
                  width: double.infinity,
                ),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions
                  .map((transaction) => Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                transaction.amount.toString(),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(transaction.title),
                                Text(transaction.date.toString()),
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}
