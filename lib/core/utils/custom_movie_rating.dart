import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:movies/core/theme/app_colors.dart';

class CustomMovieRating extends StatelessWidget {
  CustomMovieRating({
    super.key,
    required this.movie,
    required this.image,
  });
  final Movies movie;
  String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBgColor.withAlpha(181),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          SvgPicture.asset(
            image,
            color: AppColors.primaryYellowColor,
            width: 25.sp,
            height: 25.sp,
          ),
          SizedBox(
            width: 12.sp,
          ),
          Text(
            movie.rating?.toString() ?? '',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4.sp),
        ],
      ),
    );
  }
}
