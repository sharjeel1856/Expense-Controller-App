import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Catagorey/catagorey.dart';
import '../Controller/Controller.dart';

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  final TransactionController transactionController =
      Get.find<TransactionController>();
  bool isIncomeSelected = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF34A6E5),
                Color(0xFF808DF2),
                Color(0xFFB272FA),
                Color(0xFFCF69F8),
                Color(0xFFE27BBF),
                Color(0xFFF9917D),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Center(
              child: Text(
                'All Transactions',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isIncomeSelected = true;
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: isIncomeSelected
                          ? const [
                              Color(0xFF34A6E5),
                              Color(0xFF808DF2),
                              Color(0xFFB272FA),
                              Color(0xFFCF69F8),
                              Color(0xFFE27BBF),
                              Color(0xFFF9917D),
                            ]
                          : [Colors.grey, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Income',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isIncomeSelected = false;
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: !isIncomeSelected
                          ? const [
                              Color(0xFF34A6E5),
                              Color(0xFF808DF2),
                              Color(0xFFB272FA),
                              Color(0xFFCF69F8),
                              Color(0xFFE27BBF),
                              Color(0xFFF9917D),
                            ]
                          : [Colors.grey, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Expense',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              final filteredTransactions =
                  transactionController.transactions.where((transaction) {
                return (isIncomeSelected && transaction.category == 'Income') ||
                    (!isIncomeSelected && transaction.category == 'Expense');
              }).toList();

              return ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];

                  // Get the correct image based on the transaction type
                  String imageUrl = getImage(transaction.type);

                  return Dismissible(
                    key: Key(transaction.hashCode
                        .toString()), // Unique key for each transaction
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Removed',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      // Remove the transaction from the controller
                      transactionController.transactions.remove(transaction);

                      // Show a snackbar with a custom message
                      Get.snackbar(
                        'Deleted',
                        'Transaction deleted successfully',
                        snackPosition:
                            SnackPosition.BOTTOM, // Position it at the bottom
                        backgroundColor:
                            Colors.red, // Set snackbar background color to red
                        colorText: Colors.white, // Set text color to white
                        duration: const Duration(
                            seconds: 2), // Duration to show the snackbar
                        isDismissible:
                            true, // Allow the snackbar to be dismissed
                        snackStyle:
                            SnackStyle.FLOATING, // Make snackbar floating
                      );
                    },
                    child: Container(
                      height: screenHeight * 0.1, // Setting container height
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Circle Avatar for the image
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.grey[200],
                                backgroundImage:
                                    AssetImage(imageUrl), // Use AssetImage
                              ),
                              const SizedBox(width: 10),
                              // Transaction details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${transaction.category} - ${transaction.type}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Amount: Rs ${transaction.amount.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Add the date
                              Text(
                                '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
