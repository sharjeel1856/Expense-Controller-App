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

| ![1](https://github.com/user-attachments/assets/cc24b0b6-af21-4be5-95f0-118bc868e97b) | ![2](https://github.com/user-attachments/assets/4d9a29d4-687c-4627-b13a-b1fcf1eaa6bc) | ![3](https://github.com/user-attachments/assets/e76f9b50-6bbf-42d4-afc5-c4299a21cae3) | ![4](https://github.com/user-attachments/assets/2a5b1889-31d5-426f-b2f7-3c75bed997e0) |
|:---:|:---:|:---:|:---:|
| ![5](https://github.com/user-attachments/assets/2db57cbf-99dd-4901-96ae-ef4e4012dd9e) | ![6](https://github.com/user-attachments/assets/968392db-a703-4b3c-8462-2f3fad6f4f71) | ![7](https://github.com/user-attachments/assets/7a6f41f4-9e8a-4f7c-b116-100c7bb0c88b) | ![8](https://github.com/user-attachments/assets/d5f3eae6-fbfa-47e6-9a43-afee988419b4) |
| ![9](https://github.com/user-attachments/assets/438042af-4ecf-4fc4-afe4-3510f5bb457d) | ![10](https://github.com/user-attachments/assets/ef84cdca-0a37-4ffe-8983-aafa322d9285) | ![11](https://github.com/user-attachments/assets/0e6a2224-8aaa-4b4f-b7bf-bc58d8f73edb) | ![12](https://github.com/user-attachments/assets/410084f0-872e-4a81-a710-4e92840e929c) |
| ![13](https://github.com/user-attachments/assets/968392db-a703-4b3c-8462-2f3fad6f4f71) | |

