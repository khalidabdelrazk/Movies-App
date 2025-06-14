import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/custom_elvated_button.dart';
import 'package:movies/core/utils/custom_text_field.dart';
import 'package:movies/core/utils/validators.dart';
import 'package:movies/generated/locale_keys.g.dart';
import 'package:movies/presentation/profile%20update/ui/avatar_picker.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  List<String> avtarsList = [
    AppAssets.profilePic1,
    AppAssets.profilePic2,
    AppAssets.profilePic3,
    AppAssets.profilePic4,
    AppAssets.profilePic5,
    AppAssets.profilePic6,
    AppAssets.profilePic7,
    AppAssets.profilePic8,
    AppAssets.profilePic9
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool resetPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Avatar"),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 37.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  //todo: pick avatar
                  _showAvtarBottomSheet(
                    avtarsList,
                  );
                  print("selectedAvatar: $selectedAvatar");
                  setState(() {});
                },
                child: Container(
                  child: Image.asset(
                    selectedAvatar ?? AppAssets.profilePic1,
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                label: LocaleKeys.authentication_name_label.tr(),
                labelColor: AppColors.light,
                controller: nameController,
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
                validator: (text) => AppValidators.validateUsername(text),
                inputColor: AppColors.light,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                label: LocaleKeys.authentication_phone_number_label.tr(),
                labelColor: AppColors.light,
                controller: phoneController,
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
                validator: (text) => AppValidators.validatePhoneNumber(text),
                inputColor: AppColors.light,
              ),
              SizedBox(height: 16.h),
              InkWell(
                  onTap: () {
                    setState(() {
                      resetPassword = !resetPassword;
                    });
                  },
                  child:
                      Text("Reset Password?", style: AppStyles.lightRegular16)),
              SizedBox(height: 16.h),
              !resetPassword
                  ? Container()
                  : Column(children: [
                      CustomTextField(
                        label:
                            LocaleKeys.authentication_password_label.tr().tr(),
                        labelColor: AppColors.light,
                        controller: passwordController,
                        borderColor: AppColors.transparent,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SvgPicture.asset(
                            AppAssets.password,
                            width: 25.sp,
                            height: 25.sp,
                          ),
                        ),
                        // obscureText: hidePassword,
                        maxLines: 1,
                        // keyboardType: TextInputType.visiblePassword,
                        validator: (p0) => AppValidators.validatePassword(p0),
                        inputColor: AppColors.light,
                        // suffixIcon: passwordSuffixIcon(),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        label: LocaleKeys.authentication_confirm_password_label
                            .tr(),
                        labelColor: AppColors.light,
                        controller: rePasswordController,
                        borderColor: AppColors.transparent,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12.sp),
                          child: SvgPicture.asset(
                            AppAssets.password,
                            width: 25.sp,
                            height: 25.sp,
                          ),
                        ),
                        // obscureText: hidePassword,
                        // keyboardType: TextInputType.visiblePassword,
                        validator: (p0) =>
                            AppValidators.validateConfirmPassword(
                                p0, passwordController.text),
                        inputColor: AppColors.light,
                        maxLines: 1,
                        // suffixIcon: passwordSuffixIcon(),
                      ),
                    ]),
              SizedBox(height: 50.h),
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: CustomElvatedButton(
                  borderRadius: 12.r,
                  backgroundColor: AppColors.red,
                  onPressed: () {
                    //todo: delete account
                  },
                  text: "Delete Account",
                  textStyle: AppStyles.lightRegular20,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: CustomElvatedButton(
                  borderRadius: 12.r,
                  backgroundColor: AppColors.primaryYellowColor,
                  onPressed: () {
                    //todo: Update data
                  },
                  text: "Update Data",
                  textStyle: AppStyles.darkRegular20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String selectedAvatar = AppAssets.profilePic1;
  void _showAvtarBottomSheet(List<String> avatars) async {
    final selectedIndex = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: avatars.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, index); // ترجع رقم الصورة
              },
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.primaryYellowColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    avatars[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    if (selectedIndex != null) {
      setState(() {
        selectedAvatar = avatars[selectedIndex];
      });
    }
  }
}
