import 'package:flutter/material.dart';
import 'package:my_expenses_app/model/transaction_model.dart';
import 'package:my_expenses_app/data_base/database_hive.dart';

class HomePageProvider extends ChangeNotifier {
  List<TransactionModel> workList = [];
  final hive = DataBaseHive();

  void getList() {
    workList = hive.getListFromHive();
    notifyListeners();
  }

  void addModel(TransactionModel transactionModel) {
    workList.add(transactionModel);
    hive.addModel(transactionModel);
    notifyListeners();
  }

  void deleteById(String id) {
    workList.remove(id);
    notifyListeners();
    hive.deleteById(id);
  }
}
