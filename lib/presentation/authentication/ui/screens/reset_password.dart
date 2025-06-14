import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/generated/locale_keys.g.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_text_field.dart';


class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          LocaleKeys.authentication_forgot_password_button.tr(),
          style: AppStyles.primaryRegular16,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            SizedBox(
              width: 430.sp,
              height: 430.sp,
              child: Image.asset(
                AppAssets.forgetPassword,
                height: 250.sp,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30.sp),
            CustomTextField(
              label: LocaleKeys.authentication_email_label.tr(),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email, color: Colors.white),
              inputColor: AppColors.light,
              // labelColor: AppColors.darkGray,
              borderColor: AppColors.darkGray,
              backgroundColor: AppColors.darkGray,
            ),
            SizedBox(height: 25.sp),
            CustomButton(
              body: Text(
                LocaleKeys.authentication_reset_password_title.tr(),
                style: AppStyles.darkRegular20,
              ),
              color: AppColors.scaffoldBgColor,
              backgroundColor: AppColors.primaryYellowColor,
              onPressed: () {
                // TODO: Implement verify logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
