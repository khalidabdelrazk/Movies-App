import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/routes/route_names.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/custom_text_button.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../../generated/locale_keys.g.dart';
import '../cubit/Register/register_states.dart';
import '../cubit/Register/register_view_model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // RegisterViewModel registerViewModel = getIt<RegisterViewModel>();
  RegisterViewModel registerViewModel = RegisterViewModel();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocListener(
      bloc: registerViewModel,
      listener: (context, state) {
        if (state is ShowLoading) {
          return DialogUtils.showLoading(
            context: context,
          );
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: 'error',
            title: "Error",
            posActionName: 'Ok',
          );
        } else if (state is SuccessState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: 'Account Created Successfully',
            title: "Success",
            posActionName: 'Ok',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.authentication_register_button.tr(),
            style: AppStyles.primaryRegular16,
          ),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                    child: Image.asset(AppAssets.forgetPassword),
                  ),
                  Form(
                    key: registerViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: LocaleKeys.authentication_name_label.tr(),
                          labelColor: AppColors.light,
                          controller: registerViewModel.nameController,
                          borderColor: AppColors.transparent,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: SvgPicture.asset(
                              AppAssets.name,
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (p0) => AppValidators.validateUsername(p0),
                          inputColor: AppColors.light,
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          label: LocaleKeys.authentication_email_label.tr(),
                          labelColor: AppColors.light,
                          controller: registerViewModel.emailController,
                          borderColor: AppColors.transparent,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: SvgPicture.asset(
                              AppAssets.email,
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (p0) => AppValidators.validateEmail(p0),
                          inputColor: AppColors.light,
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          label: LocaleKeys.authentication_password_label
                              .tr()
                              .tr(),
                          labelColor: AppColors.light,
                          controller: registerViewModel.passwordController,
                          borderColor: AppColors.transparent,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: SvgPicture.asset(
                              AppAssets.password,
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          obscureText: hidePassword,
                          maxLines: 1,
                          // keyboardType: TextInputType.visiblePassword,
                          validator: (p0) => AppValidators.validatePassword(p0),
                          inputColor: AppColors.light,
                          suffixIcon: passwordSuffixIcon(),
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          label: LocaleKeys
                              .authentication_confirm_password_label
                              .tr(),
                          labelColor: AppColors.light,
                          controller: registerViewModel.rePasswordController,
                          borderColor: AppColors.transparent,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: SvgPicture.asset(
                              AppAssets.password,
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          obscureText: hidePassword,
                          // keyboardType: TextInputType.visiblePassword,
                          validator: (p0) =>
                              AppValidators.validateConfirmPassword(p0,
                                  registerViewModel.passwordController.text),
                          inputColor: AppColors.light,
                          maxLines: 1,
                          suffixIcon: passwordSuffixIcon(),
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          label:
                              LocaleKeys.authentication_phone_number_label.tr(),
                          labelColor: AppColors.light,
                          controller: registerViewModel.phoneController,
                          borderColor: AppColors.transparent,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: SvgPicture.asset(
                              AppAssets.phone,
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (p0) =>
                              AppValidators.validatePhoneNumber(p0),
                          inputColor: AppColors.light,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    height: 56.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryYellowColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.authentication_create_account_button.tr(),
                        style: AppStyles.darkRegular20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.authentication_already_have_account_prompt
                            .tr(),
                        style: AppStyles.lightRegular16,
                      ),
                      CustomTextButton(
                        txt: LocaleKeys.authentication_login_link.tr(),
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.login);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordSuffixIcon() {
    return IconButton(
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility));
  }
}
