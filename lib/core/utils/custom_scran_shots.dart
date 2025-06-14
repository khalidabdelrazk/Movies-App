import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/theme/app_colors.dart';

Widget CostumScreanShots({required String image}) {
  return Container(
    height: 200.sp,
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(image), fit: BoxFit.fill)),
  );
}
