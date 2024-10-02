import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navigation_controller.dart';

class SettingsScreen extends StatelessWidget {
  final NavigationController navController = Get.find();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Settings screen'),
      ),
    );
  }
}
