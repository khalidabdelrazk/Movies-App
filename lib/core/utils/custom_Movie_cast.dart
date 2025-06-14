import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';

Widget CustomMovieCast({required String name,required String character}) {
  return Container(
    padding: EdgeInsets.all(10.r),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.light, width: 2),
    ),
    child: Row(
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(AppAssets.onBoarding3), fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 15.r,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name:Hayley Atwell",
              style: AppStyles.lightRegular16,
            ),
            SizedBox(
              height: 15.r,
            ),
            Text(
              "Character : Captain Carter",
              style: AppStyles.lightRegular16,
            )
          ],
        )
      ],
    ),
  );
}
