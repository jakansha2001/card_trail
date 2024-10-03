import 'dart:math';
import 'package:card_trail/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var transactions =
      <DailyTransactions>[].obs; // Observable list of transactions
  var isLoading = true.obs; // Loading state

  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  Future<void> fetchTransactions() async {
    try {
      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
      // Generate sample data for the past 365 days
      transactions.value = _generateMockDataFor365Days();
    } catch (e) {
      // Handle errors
      debugPrint('Error fetching transactions: $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<DailyTransactions> _generateMockDataFor365Days() {
    List<DailyTransactions> mockData = [];
    Random random = Random();

    for (int i = 0; i < 365; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      List<Transaction> dailyTransactions = [];

      // Generate a random number of transactions for the day (1 to 10)
      int numberOfTransactions = random.nextInt(10) + 1;

      for (int j = 0; j < numberOfTransactions; j++) {
        bool isCredit = random.nextBool(); // Randomly choose credit or debit
        double amount = (random.nextDouble() * 100)
            .roundToDouble(); // Random amount between 0 and 100

        dailyTransactions.add(
          Transaction(
            category: isCredit ? 'Income' : 'Expense ${j + 1}',
            amount: amount,
            isCredit: isCredit,
            date: date,
          ),
        );
      }

      mockData
          .add(DailyTransactions(date: date, transactions: dailyTransactions));
    }

    return mockData;
  }

  List<Transaction> get recentTransactions {
    // Flatten the daily transactions into a single list
    List<Transaction> allTransactions = transactions
        .expand((dailyTransaction) => dailyTransaction.transactions)
        .toList();

    // Sort transactions by date and get the most recent ones
    allTransactions.sort((a, b) => b.date.compareTo(a.date));

    // Return the 15 most recent transactions
    return allTransactions.take(15).toList();
  }
}
