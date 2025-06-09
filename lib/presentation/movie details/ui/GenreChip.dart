import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_styles.dart';

class GenreChip extends StatelessWidget {
  final String label;

  const GenreChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: AppStyles.lightRegular16.copyWith(color: Colors.white70),
      ),
    );
  }
}
