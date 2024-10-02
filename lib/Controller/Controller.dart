import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Model/Model.dart';

class Transaction {
  final double amount;
  final String
      category; // Assuming category is a string (e.g., "Income" or "Expense")
  final String type; // You can define this further if needed
  final DateTime date;

  Transaction({
    required this.amount,
    required this.category,
    required this.type,
    required this.date,
  });
}

class TransactionController extends GetxController {
  var transactions = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    _openBox();
  }

  void _openBox() async {
    var box = await Hive.openBox<TransactionModel>('transactions');
    transactions.value = box.values
        .map((e) => Transaction(
              amount: e.amount,
              category: e.category,
              type: e.type,
              date: e.date,
            ))
        .toList();
  }

  void addTransaction({
    required double amount,
    required String category,
    required String type,
    required DateTime date,
  }) async {
    var box = await Hive.openBox<TransactionModel>('transactions');
    TransactionModel transactionModel = TransactionModel(
      amount: amount,
      category: category,
      type: type,
      date: date,
    );

    await box.add(transactionModel); // Save to Hive
    transactions.add(Transaction(
      amount: amount,
      category: category,
      type: type,
      date: date,
    )); // Update local state

    print("Transaction added: $transactionModel");
  }

  // Calculate total income
  double getTotalIncome() {
    return transactions
        .where((transaction) => transaction.category == 'Income')
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  // Calculate total expenses
  double getTotalExpense() {
    return transactions
        .where((transaction) => transaction.category == 'Expense')
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }
}
