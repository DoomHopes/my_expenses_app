import 'package:hive/hive.dart';

import 'package:my_expenses_app/model/transaction_model.dart';

class DataBaseHive {
  void addModel(TransactionModel transactionModel) {
    final _modelBox = Hive.box<TransactionModel>('modelbox');
    _modelBox.add(transactionModel);
  }

  TransactionModel getModel(int _index) {
    final _modelBox = Hive.box<TransactionModel>('modelbox');
    final _model = _modelBox.get(_index);
    return _model;
  }

  List<TransactionModel> getListFromHive() {
    final List<TransactionModel> _list = [];
    final length = getHiveLength();
    for (int i = 0; i < length; i++) {
      _list.add(getModel(i));
    }
    return _list;
  }

  int getHiveLength() {
    final _movieBox = Hive.box<TransactionModel>('modelbox');
    final length = _movieBox.length;
    return length;
  }

  void deleteHive() {
    final _modelBox = Hive.box<TransactionModel>('modelbox');
    _modelBox.deleteFromDisk();
  }

  void deleteById(String id) {
    final _modelBox = Hive.box<TransactionModel>('modelbox');
    _modelBox.delete(id);
  }
}
