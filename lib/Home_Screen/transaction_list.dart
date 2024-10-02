// transaction_list.dart
import 'package:expence_controller/Catagorey/catagorey.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<String> images = [
    'assets/icons/shopping.png',
    'assets/icons/exercise.png',
    'assets/icons/fast-food.png',
    'assets/icons/travel-bag.png',
    'assets/icons/car.png',
  ];

  final List<String> names = [
    'MonthlyIncome',
    'HousingCost',
    'Utilities',
    'Groceries',
    'Transportation',
    'HealthCare',
    'PersonalCare',
    'Entertainment',
    'Clothing',
    'SavingsInvestments',
    'DebtPayments',
    'Miscellaneous'
  ];

  final List<double> amounts = [
    50.0,
    30.0,
    20.0,
    100.0,
    75.0,
    50.0,
    30.0,
    20.0,
    100.0,
    75.0,
    30.0,
    22.0
  ]; // Example amounts

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      padding: EdgeInsets.zero, // important concept
      itemCount: names.length,
      shrinkWrap: true, // Makes the ListView take only the space it needs
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: Container(
            height: screenHeight * 0.1, // 10% of screen height
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage(getImage(names[index])),
                ),
                SizedBox(width: 10), // Space between avatar and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      names[index],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4), // Space between name and amount
                    Text(
                      '\$${amounts[index].toStringAsFixed(2)}', // Dynamic amount
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
