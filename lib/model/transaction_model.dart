import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;

  TransactionModel({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
