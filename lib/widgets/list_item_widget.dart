import 'package:flutter/material.dart';
import 'package:my_expenses_app/model/transaction_model.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses_app/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  ListItem({this.transactionModel, this.index});

  final TransactionModel transactionModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transactionModel.amount.toDouble()}'),
            ),
          ),
        ),
        title: Text(
          transactionModel.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactionModel.date.toLocal()),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () =>
              context.read<HomePageProvider>().delete(transactionModel, index),
        ),
      ),
    );
  }
}
