# 💰 Expense Controller App

The **Expense Controller App** is a Flutter-based mobile application that helps users efficiently manage and control their monthly expenses. It offers an intuitive interface for tracking income, expenses, and viewing real-time financial summaries.

## 🎯 Purpose

The purpose of this app is to provide users with a practical tool to manage their monthly expenses by keeping a detailed record of their income and expenses. This app allows users to gain better control over their finances and make informed financial decisions.

## ✨ Features

- 📝 **Track Income and Expenses:** Add detailed entries for income and expenses with categories, amounts, and dates.
- 🔄 **Real-Time Balance Calculation:** Automatically calculates the balance by subtracting expenses from income.
- 📊 **View Recent Transactions:** Displays recent transactions with all necessary details (category, amount, date).
- 🗂️ **Categorization:** Classify transactions by categories, giving users a clear breakdown of their spending habits.

## 🧠 State Management

The app uses **GetX** for state management, ensuring smooth handling of transactions, real-time UI updates, and efficient navigation.

## 🗄️ Backend Functionality

The app uses **Hive**, a fast and lightweight NoSQL database, to store income, expenses, and transaction data locally on the device, ensuring data persistence and offline functionality.

## 🎨 Design Inspiration

The design inspiration was taken from **Dribbble** to create a modern, clean, and visually appealing user interface.

## 📦 Packages Used

- `get`: For state management and navigation.
- `hive`: For data storage (income, expenses, and transactions).
- `hive_flutter`: For integrating Hive with Flutter.
- `path_provider`: To locate paths in the filesystem.
- `cupertino_icons`: iOS-style icons for a polished UI.

## 🚀 Installation

To run the app locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/your-repository-url.git
   ```

2. Navigate to the project directory:

   ```bash
   cd expense-controller-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## 🖥️ User Interface

- **Home Screen:** Displays a summary of your current income and expenses.
- **Add Transaction Screen:** Allows users to input new income or expense transactions, including details like category, amount, and date.
- **Transaction List Screen:** Shows a categorized list of all transactions for better expense management.

## 📸 Screenshots

(Attach screenshots of your app interface here to showcase the UI design and functionality.)

---

This README file includes all the necessary sections and emojis, following the format you requested. You can now customize and attach your screenshots at the end.
