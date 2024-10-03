import 'package:card_trail/controllers/home_controller.dart';
import 'package:card_trail/core/constants/constants.dart';
import 'package:card_trail/core/widgets/color_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 58,
                    backgroundColor: Colors.white38,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/64529996?v=4',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 15.0,
                  ),
                  child: Text(
                    'Open New Card',
                    style: headerTextStyle,
                  ),
                ),
                Text(
                  'Build your wealth easily with our international interest rate',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: subHeading,
                ).paddingSymmetric(horizontal: 15),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => Container(
                    width: 450,
                    height: 234,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          homeController.imgUrl.value,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          const Image(
                            image: AssetImage(
                              'assets/images/cc.png',
                            ),
                            width: 140,
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40.0,
                              top: 30,
                            ),
                            child: Obx(() => Text(
                              homeController.cardAmount.value, // Reactive card amount
                              style: cardTextHead,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40.0,
                              top: 45.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(
                                  homeController.cardNumber.value, // Reactive card number
                                  style: cardNumber,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Obx(() => Text(
                                    homeController.expiryDate.value, // Reactive expiry date
                                    style: cardDate,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorButton(
                        onTap: () {
                          homeController.changeImage(
                              'assets/images/bg1.png', true, false, false);
                        },
                        isSelected: homeController.btn1.value,
                        img: 'assets/images/btn1.png',
                      ),
                      ColorButton(
                        onTap: () {
                          homeController.changeImage(
                              'assets/images/bg2.png', false, true, false);
                        },
                        isSelected: homeController.btn2.value,
                        img: 'assets/images/btn2.png',
                      ),
                      ColorButton(
                        onTap: () {
                          homeController.changeImage(
                              'assets/images/bg3.png', false, false, true);
                        },
                        isSelected: homeController.btn3.value,
                        img: 'assets/images/btn3.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
