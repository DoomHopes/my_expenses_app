import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_expenses_app/providers/home_page_provider.dart';
import 'package:my_expenses_app/widgets/chart_widget.dart';
import 'package:my_expenses_app/widgets/new_transaction_widget.dart';
import 'package:my_expenses_app/widgets/transaction_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomePageProvider>().getList();
    super.initState();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, providerData, child) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Chart(providerData.workList),
              TransactionList(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
