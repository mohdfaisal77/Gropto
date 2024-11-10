import 'package:flutter/material.dart';
import 'package:gropto/helper/app_colors.dart';

import '../../helper/app_images.dart';
class SplashLayout extends StatelessWidget {

  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned.fill(
      child: Container(
        color: AppColors.white,
        child: Center(
          child: Image(
            width: screenWidth * 0.3,
            // width: 120,
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.app_logo,
            ),
          ),
        ),
      ),
    );
  }
}
