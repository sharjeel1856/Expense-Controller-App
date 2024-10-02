import 'package:expence_controller/Home_Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CatagoreyIcons/ImagesClass.dart';
import '../Controller/Controller.dart';
import 'DropDownBtn.dart';
import 'SelectDate.dart'; // Import the modified DatePicker

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  double amount = 0.0;
  String? selectedCategory;
  String? selectedCategoryType;
  DateTime? selectedDate; // Store the selected date

  final List<String> categories = ['Income', 'Expense'];
  final List<String> categoriesType = [
    'Monthly Income',
    'Housing Cost',
    'Utilities',
    'Groceries',
    'Transportation',
    'HealthCare',
    'Personal Care',
    'Entertainment',
    'Clothing',
    'Savings & Investments',
    'Debt Payments',
    'Miscellaneous'
  ];

  // Controller to manage the amount input
  TextEditingController amountController = TextEditingController();

  // GetX controller to manage the transactions
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                'Add Information',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        amount = double.tryParse(value) ?? 0.0;
                      });
                    },
                    style: const TextStyle(
                      // This sets the input text color
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Add Amount',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      suffixIcon: const Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              CustomDropdownButton(
                dropDownItems: categories,
                selectedItem: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                hintText: 'Select Category',
              ),
              const SizedBox(height: 35),
              CustomDropdownButton(
                dropDownItems: categoriesType,
                selectedItem: selectedCategoryType,
                onChanged: (value) {
                  setState(() {
                    selectedCategoryType = value;
                  });
                },
                hintText: 'Category Type',
              ),
              const SizedBox(height: 35),

              // Date Selector
              DatePicker(
                selectedDate: selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date; // Store selected date
                  });
                },
              ),

              const SizedBox(height: 45),
              InkWell(
                onTap: () {
                  if (amount > 0 &&
                      selectedCategory != null &&
                      selectedCategoryType != null &&
                      selectedDate != null) {
                    // Add the transaction using the controller
                    transactionController.addTransaction(
                      amount: amount,
                      category: selectedCategory!,
                      type: selectedCategoryType!,
                      date: selectedDate!,
                    );

                    // Show a Snackbar message
                    Get.snackbar(
                      'Success',
                      'Transaction added successfully',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );

                    // Navigate to the home screen
                    Get.off(() =>
                        const home_screen()); // Use Get.off() to replace the current screen
                  } else {
                    print('Please fill all fields');
                    Get.snackbar(
                      'Error',
                      'Please fill all fields',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    gradient: const LinearGradient(
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
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getImage(String category) {
  switch (category.toLowerCase()) {
    case 'monthlyincome':
    case 'monthly income': // Multiple cases for the same condition
      return AppImages.monthlyIncome;
    case 'housingcost':
    case 'housing cost':
      return AppImages.housingCost;
    case 'utilities':
      return AppImages.utilities;
    case 'groceries':
      return AppImages.groceries;
    case 'transportation':
      return AppImages.transportation;
    case 'healthcare':
      return AppImages.healthCare;
    case 'personalcare':
    case 'personal care':
      return AppImages.personalCare;
    case 'entertainment':
      return AppImages.entertainment;
    case 'clothing':
      return AppImages.clothing;
    case 'savingsinvestments':
    case 'savings & investments':
      return AppImages.savingsInvestments;
    case 'debtpayments':
    case 'debt payments':
      return AppImages.debtPayments;
    case 'miscellaneous':
      return AppImages.miscellaneous;
    default:
      return 'assets/default.png'; // Fallback image if no match is found
  }
}
