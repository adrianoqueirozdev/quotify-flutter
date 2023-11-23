import 'package:get/get.dart';
import 'package:quotify/shared/constants/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.home);
    });

    super.onInit();
  }
}
