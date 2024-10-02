import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: const Color(0xff161621)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(NavigationController());
      }),
    );
  }
}
