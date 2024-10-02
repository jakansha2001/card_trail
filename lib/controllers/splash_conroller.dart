import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_trail/main_screen.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    // Initialize the animation controller
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    // Navigate to HomeScreen after animation
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => MainScreen());
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
