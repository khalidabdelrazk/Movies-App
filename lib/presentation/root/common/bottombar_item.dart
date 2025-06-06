import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/theme/app_colors.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
    this.icon, {
    super.key,
    this.onTap,
    this.isActive = false,
    this.isNotified = false,
  });
  final String icon;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(7.sp),
              child: SvgPicture.asset(
                icon,
                color:
                    isActive ? AppColors.primaryYellowColor : AppColors.light,
                width: 25.sp,
                height: 25.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
