import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTransactions;
  TransactionList(this.transactions, this.deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Text(
            'No Transactions',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    }) :ListView.builder(
        itemBuilder: (value, index) => Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('\$${transactions[index].amount}'),
                    ),
                  ),
            title: Text(
              transactions[index].title, style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
            ),
            trailing: MediaQuery.of(context).size.width > 460
                ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              onPressed: () => deleteTransactions(transactions[index].id),
            )
                : IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteTransactions(transactions[index].id),
            ),
                ),
        ),
              itemCount: transactions.length,
    );
  }
}
