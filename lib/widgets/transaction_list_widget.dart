import 'package:flutter/material.dart';
import 'package:my_expenses_app/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, providerData, child) => Container(
        height: 450,
        child: providerData.workList.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/empty.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemCount: providerData.workList.length,
                itemBuilder: (context, index) {
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
                            child: Text(
                                '\$${providerData.workList[index].amount.toDouble()}'),
                          ),
                        ),
                      ),
                      title: Text(
                        providerData.workList[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                            providerData.workList[index].date.toLocal()),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => providerData.delete(
                            providerData.workList[index], index),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
