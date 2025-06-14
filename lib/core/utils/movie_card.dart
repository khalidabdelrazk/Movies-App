import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/theme/app_colors.dart';

import '../model/movies_response.dart';
import 'custom_image.dart';

class MoviePosterCard extends StatelessWidget {
  final Movies movie;
  final double? width, height;
  final VoidCallback? onPressed;

  const MoviePosterCard({
    super.key,
    required this.movie,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 198.sp,
        height: height ?? 279.sp,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            // Movie Poster Image
            CustomImage(
              movie.mediumCoverImage ?? '',
              width: width ?? 198.sp,
              height: height ?? 279.sp,
              isNetwork: true,
              fit: BoxFit.cover,
              radius: 12.r,
              isShadow: false,
            ),

            // Rating Badge
            Positioned(
              top: 8.sp,
              left: 8.sp,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBgColor.withAlpha(181),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      movie.rating?.toString() ?? '',
                      style: TextStyle(
                        color: AppColors.primaryYellowColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4.sp),
                    SvgPicture.asset(
                      AppAssets.star,
                      color: AppColors.primaryYellowColor,
                      width: 15.sp,
                      height: 15.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
