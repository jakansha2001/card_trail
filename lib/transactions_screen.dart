import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navigation_controller.dart';

class TransactionsScreen extends StatelessWidget {
  final NavigationController navController = Get.find();

  TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Transactions screen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
