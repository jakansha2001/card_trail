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
                ).paddingSymmetric(horizontal: 10),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => Container(
                    width: double.infinity,
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
                            child: Text(
                              '\$1,500,000',
                              style: cardTextHead,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40.0,
                              top: 45.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '**** **** **** 1996',
                                  style: cardNumber,
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Text(
                                    '08/30',
                                    style: cardDate,
                                  ),
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
                // const SizedBox(
                //   height: 70,
                // ),
                // ElevatedButton(
                //   style: saveCard,
                //   onPressed: () {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         //backgroundColor: Color(0xff161621),
                //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                //         content: Text(
                //           'Your Card is Saved ✅',
                //           style: snackbarText,
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //     );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //       left: 100.0,
                //       right: 100.0,
                //       top: 20,
                //       bottom: 20,
                //     ),
                //     child: Text(
                //       'Save My Card',
                //       style: saveCardTextStyle,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
