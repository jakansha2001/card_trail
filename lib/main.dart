import 'package:card_trail/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';
import 'controllers/navigation_controller.dart';

void main() {
  runApp(const CardTrail());
}

class CardTrail extends StatelessWidget {
  const CardTrail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xff161621),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor:
              AppColors.splashBackground, // Color for the selected item
        ),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(NavigationController());
      }),
    );
  }
}
