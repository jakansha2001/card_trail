import 'package:card_trail/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionController controller = Get.find();

    return Obx(() {
      final recentTransactions = controller.recentTransactions;

      return Container(
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height *
            0.544, // Dynamic height (54% of the screen height)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: recentTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = recentTransactions[index];
                  return ListTile(
                    title: Text(
                      transaction.category,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transaction.date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      '${transaction.isCredit ? '+' : '-'} ${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: transaction.isCredit ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
