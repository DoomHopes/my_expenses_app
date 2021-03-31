import 'package:flutter/material.dart';
import 'package:my_expenses_app/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

import 'list_item_widget.dart';

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
                  return ListItem(
                    transactionModel: providerData.workList[index],
                    index: index,
                  );
                },
              ),
      ),
    );
  }
}
