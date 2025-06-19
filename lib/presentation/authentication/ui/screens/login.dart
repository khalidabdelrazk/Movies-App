import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/generated/locale_keys.g.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_text_button.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/shared_pref_services.dart';
import '../cubit/authentication/auth_states.dart';
import '../cubit/authentication/auth_view_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  AuthViewModel authViewModel = getIt<AuthViewModel>();

  bool _obscurePassword = true; // State for password visibility

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authViewModel,
      listener: (context, state) async {
        if (state is ShowLoading) {
          return DialogUtils.showLoading(
            context: context,
          );
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            title: "Failed to login",
            posActionName: 'Ok',
          );
        } else if (state is SuccessState) {
          DialogUtils.hideLoading(context);
          await SharedPrefService.instance.setToken(state.response.data);
          DialogUtils.showMessage(
              context: context,
              message: 'Login Successfully \n ${state.response.data}',
              title: "Success",
              posActionName: 'Ok',
              posAction: () {
                Navigator.pushReplacementNamed(context, RouteNames.root);
              });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black, // Set background color to black
        body: SingleChildScrollView(
          // To prevent overflow on small screens when keyboard appears
          padding: EdgeInsets.symmetric(horizontal: 19.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 67.sp),
              Image.asset(
                AppAssets.moviesIcon,
                height: 118.sp,
                width: 121.sp,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 69.sp),

              Form(
                key: authViewModel.formKey,
                child: Column(
                  children: [
                    // Email Input
                    CustomTextField(
                      controller: authViewModel.emailController,
                      label: LocaleKeys.authentication_email_label.tr(),
                      inputColor: AppColors.light,
                      keyboardType: TextInputType.emailAddress,
                      backgroundColor: AppColors.darkGray,
                      prefixIcon: const Icon(Icons.email_outlined,
                          color: AppColors.light),
                    ),
                    SizedBox(height: 15.sp),

                    CustomTextField(
                      controller: authViewModel.loginPasswordController,
                      label: LocaleKeys.authentication_password_label.tr(),
                      backgroundColor: AppColors.darkGray,
                      inputColor: AppColors.light,
                      maxLines: 1,
                      prefixIcon: const Icon(Icons.lock_outline,
                          color: AppColors.light),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.light,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      obscureText: _obscurePassword,
                      borderColor: AppColors.transparent,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.sp),
              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  txt: LocaleKeys.authentication_forgot_password_button.tr(),
                  onPressed: () {
                    // todo: forgetPassword
                    Navigator.pushNamed(context, RouteNames.resetPassword);
                  },
                  color: AppColors.primaryYellowColor,
                ),
              ),
              SizedBox(height: 5.sp),

              CustomButton(
                body: Text(
                  LocaleKeys.authentication_login_button.tr(),
                  style: AppStyles.darkRegular20,
                ),
                color: AppColors.scaffoldBgColor,
                backgroundColor: AppColors.primaryYellowColor,
                onPressed: () {
                  // todo: login Logic
                  authViewModel.login();
                },
              ),

              SizedBox(height: 5.sp),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    LocaleKeys.authentication_dont_have_account_prompt.tr(),
                    style: AppStyles
                        .lightRegular16, // Adjust color as per your theme
                  ),
                  CustomTextButton(
                    txt: LocaleKeys.authentication_create_account_button.tr(),
                    onPressed: () {
                      // todo: navigate to Register
                      Navigator.pushNamed(context, RouteNames.register);
                    },
                    color: AppColors.primaryYellowColor,
                  ),
                ],
              ),

              SizedBox(height: 5.sp),

              Row(
                children: <Widget>[
                  Expanded(
                      child: Divider(
                          color: AppColors.primaryYellowColor, thickness: 1)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: Text(
                        LocaleKeys.authentication_or_separator.tr(),
                        style: AppStyles.primaryRegular14,
                      )),
                  Expanded(
                      child: Divider(
                          color: AppColors.primaryYellowColor, thickness: 1)),
                ],
              ),
              SizedBox(height: 15.sp),

              CustomButton(
                body: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      AntDesign.google_outline,
                      color: AppColors.scaffoldBgColor,
                      size: 26.sp,
                    ),
                    SizedBox(width: 10.sp),
                    Text(
                      LocaleKeys.authentication_login_with_google_button.tr(),
                      style: AppStyles.darkRegular20.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
                color: AppColors.scaffoldBgColor,
                backgroundColor: AppColors.primaryYellowColor,
                onPressed: () {
                  // TODO: Implement verify logic
                },
              ),
              SizedBox(height: 40.sp),
            ],
          ),
        ),
      ),
    );
  }
}
