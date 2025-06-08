import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle blackBold20 = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.black);
  static TextStyle primaryBold20 = GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryYellowColor);
  static TextStyle primaryRegular14 = GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryYellowColor);
  static TextStyle primaryRegular16 = GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryYellowColor);
  static TextStyle lightMedium36 = GoogleFonts.inter(
      fontSize: 36.sp, fontWeight: FontWeight.w500, color: AppColors.light);
  static TextStyle lightBold24 = GoogleFonts.inter(
      fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.light);
  static TextStyle lightBold20 = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.light);
  static TextStyle lightRegular20 = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.light);
  static TextStyle lightRegular16 = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.light);
  static TextStyle darkLightRegular20 = GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.light.withAlpha(200));
  static TextStyle darkSemiBold20 = GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.scaffoldBgColor);
  static TextStyle darkRegular20 = GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.scaffoldBgColor);
  static TextStyle darkGrayRegular20 = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeight.w400, color: AppColors.gray);
}
