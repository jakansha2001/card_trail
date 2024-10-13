import 'package:card_trail/home_screen.dart';
import 'package:card_trail/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navigation_controller.dart';

class MainScreen extends StatelessWidget {
  final NavigationController navController = Get.find();

  final List<Widget> pages = [
    const HomeScreen(),
    const TransactionScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[navController.selectedIndex.value]),
      bottomNavigationBar: Obx(() => Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              currentIndex: navController.selectedIndex.value,
              onTap: navController.changePage,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card_rounded),
                    label: 'Transactions'),
              ],
            ),
          )),
    );
  }
}
