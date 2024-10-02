import 'package:hive/hive.dart';

part 'Model.g.dart'; // Add this line

@HiveType(typeId: 0) // You must specify a unique typeId for the class.
class TransactionModel {
  @HiveField(0)
  double amount;

  @HiveField(1)
  String category; // 'Income' or 'Expense'

  @HiveField(2)
  String type; // E.g., 'shop', 'grocery', etc.

  @HiveField(3)
  DateTime date;

  TransactionModel({
    required this.amount,
    required this.category,
    required this.type,
    required this.date,
  });
}
