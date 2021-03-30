import 'package:flutter/material.dart';
import 'package:my_expenses_app/model/transaction_model.dart';
import 'package:my_expenses_app/data_base/database_hive.dart';

class HomePageProvider extends ChangeNotifier {
  List<TransactionModel> workList = [];
  final hive = DataBaseHive();

  Future<void> getList() async {
    workList = await hive.getListFromHive();
    notifyListeners();
  }

  void addModel(TransactionModel transactionModel) {
    workList.add(transactionModel);
    hive.addModel(transactionModel);
    notifyListeners();
  }

  void deleteById(TransactionModel transactionModel) {
    workList.remove(transactionModel);
    notifyListeners();
    hive.deleteById(transactionModel.id);
  }
}
