import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quotify/presentation/splash/splash_controller.dart';
import 'package:quotify/shared/constants/app_images.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quotify/shared/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 0,
          ),
          body: Center(
            child: SvgPicture.asset(AppImages.logo2)
                .animate()
                .fadeIn(
                  duration: 900.ms,
                )
                .then(delay: 1000.ms)
                .shake(
                  duration: 500.ms,
                  curve: Curves.easeIn,
                ),
          ),
        );
      },
    );
  }
}
