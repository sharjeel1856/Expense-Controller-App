import 'package:expence_controller/Catagorey/catagorey.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Controller.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return const Home_Page();
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;
    double screenHeight = Get.height;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color(0xFF34A6E5),
                  Color(0xFF808DF2),
                  Color(0xFFB272FA),
                  Color(0xFFCF69F8),
                  Color(0xFFE27BBF),
                  Color(0xFFF9917D)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Obx(() {
                    // Calculate total balance: income - expenses
                    double totalBalance =
                        transactionController.getTotalIncome() -
                            transactionController.getTotalExpense();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rs ${totalBalance.toStringAsFixed(1)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_downward,
                                size: 15,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                const Text(
                                  'Income',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 2),
                                Obx(() {
                                  return Text(
                                    transactionController
                                        .getTotalIncome()
                                        .toStringAsFixed(0),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  );
                                }),
                                const SizedBox(width: 40),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_upward,
                                size: 15,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                const Text(
                                  'Expenses',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 2),
                                Obx(() {
                                  return Text(
                                    transactionController
                                        .getTotalExpense()
                                        .toStringAsFixed(0),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[800],
                                    ),
                                  );
                                }),
                                const SizedBox(width: 40),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.001),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/ViewData');
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Obx(() {
                        // Get the most recent 8 transactions
                        var recentTransactions = transactionController
                            .transactions.reversed
                            .take(8)
                            .toList();

                        if (recentTransactions.isEmpty) {
                          return const Center(
                            child: Text(
                              'No Transactions',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero, // important concept
                          itemCount: recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = recentTransactions[index];

                            // Get the correct image based on the transaction type
                            String imageUrl = getImage(transaction.type);

                            return Container(
                              height: screenHeight *
                                  0.1, // Setting container height
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
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
                                        backgroundImage: AssetImage(
                                            imageUrl), // Use AssetImage
                                      ),
                                      const SizedBox(width: 10),
                                      // Transaction details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                            );
                          },
                        );
                      }),
                      Positioned(
                        bottom: 15,
                        left: 160,
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF34A6E5),
                                  Color(0xFF808DF2),
                                  Color(0xFFB272FA),
                                  Color(0xFFCF69F8),
                                  Color(0xFFE27BBF),
                                  Color(0xFFF9917D)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => Category());
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                            color: Colors.white, // Icon color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
