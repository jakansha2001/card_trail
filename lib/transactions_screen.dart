import 'package:card_trail/controllers/transaction_controller.dart';
import 'package:card_trail/core/constants/app_colors.dart';
import 'package:card_trail/core/widgets/recent_transactions_widget.dart';
import 'package:card_trail/core/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.put(TransactionController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Obx(() {
        if (transactionController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.white,
          ));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: TransactionWidget(
                      transactions: transactionController.transactions)),
              const RecentTransactionsWidget(),
            ],
          ),
        );
      }),
    );
  }
}
