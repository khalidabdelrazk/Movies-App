import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    fontFamily: GoogleFonts.roboto().fontFamily,
    primaryColor: AppColors.light,
    cardColor: AppColors.primaryYellowColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      // titleTextStyle: darkMedium20,
      iconTheme: IconThemeData(color: AppColors.primaryYellowColor),
    ),
    // textTheme: TextTheme(
    //   bodySmall: darkMedium14,
    //   labelSmall: darkMedium12,
    //   bodyMedium: darkMedium20,
    //   bodyLarge: darkMedium24,
    //   headlineSmall: lightGrayMedium12,
    // ),
  );
}
