import 'package:card_trail/controllers/splash_conroller.dart';
import 'package:card_trail/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the SplashController
    final SplashController splashController = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: ScaleTransition(
          scale: splashController.animation, // Use the controller's animation
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(splashController.animation),
            child: Image.asset('assets/images/splash_card.png',width: 200,
            height: 200,),
          ),
        ),
      ),
    );
  }
}
