import 'package:get/get.dart';

class HomeController extends GetxController {
  var cardAmount = '\$1,500,000'.obs; // Mock card amount
  var cardNumber = '**** **** **** 1996'.obs; // Mock card number
  var expiryDate = '08/30'.obs; // Mock expiry date
  var imgUrl = 'assets/images/bg1.png'.obs;
  var btn1 = true.obs;
  var btn2 = false.obs;
  var btn3 = false.obs;

  void changeImage(String newImgUrl, bool isBtn1, bool isBtn2, bool isBtn3) {
    imgUrl.value = newImgUrl;
    btn1.value = isBtn1;
    btn2.value = isBtn2;
    btn3.value = isBtn3;
  }
}
