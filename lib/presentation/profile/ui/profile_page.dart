import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/custom_elvated_button.dart';
import 'package:movies/core/utils/shared_pref_services.dart';
import 'package:movies/presentation/profile/ui/cubit/profile_page_states.dart';
import 'package:movies/presentation/profile/ui/cubit/profile_page_view_model.dart';
import 'package:movies/presentation/profile/ui/history_list.dart';
import 'package:movies/presentation/profile/ui/watch_list.dart';

import '../../../core/utils/dialog_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfilePageViewModel viewModel = getIt<ProfilePageViewModel>();
  int selectedIndex = 1;
  @override
  void initState() {
    super.initState();
    viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<ProfilePageViewModel, ProfilePageStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ProfileErrorState) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.sp,
                      color: AppColors.red,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Error',
                      style: AppStyles.lightBold24,
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Text(
                        state.failures.errorMessage,
                        style: AppStyles.lightRegular16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomElvatedButton(
                      onPressed: () => viewModel.getData(),
                      text: 'Retry',
                      backgroundColor: AppColors.primaryYellowColor,
                      textStyle: AppStyles.darkRegular20,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileSuccessState) {
            final user = state.getProfileResponseEntity.data;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 389.h,
                      padding: EdgeInsets.only(
                          top: 40.h, bottom: 0.h, left: 10.w, right: 10.w),
                      color: AppColors.darkGray,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //todo: get image
                                  Image.asset(
                                    "assets/images/gamer ${user?.avaterId ?? 1}.png",
                                    width: 118.w,
                                    height: 118.h,
                                  ),
                                  SizedBox(height: 15.h),
                                  //todo: get name
                                  Text(
                                    user?.name ?? "user Name",
                                    style: AppStyles.lightBold20,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    //todo: get wish list count
                                    "10",
                                    style: AppStyles.lightBold24,
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    "Wish List",
                                    style: AppStyles.lightBold24,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    //todo: get history count
                                    "12",
                                    style: AppStyles.lightBold24,
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    "History",
                                    style: AppStyles.lightBold24,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomElvatedButton(
                                  borderRadius: 12.r,
                                  backgroundColor: AppColors.primaryYellowColor,
                                  onPressed: () {
                                    //todo: navigate to edit profile
                                    Navigator.pushNamed(
                                        context, RouteNames.profileUpdate,
                                        arguments: {
                                          'name': user!.name,
                                          'email': user.email,
                                          'avtarId': user.avaterId,
                                          'viewModel': viewModel,
                                        });
                                  },
                                  text: "Edit Profile",
                                  textStyle: AppStyles.darkRegular20,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                flex: 1,
                                child: CustomElvatedButton(
                                  borderRadius: 12.r,
                                  backgroundColor: AppColors.red,
                                  onPressed: () {
                                    //todo: navigate to login
                                    showLogoutConfirmationDialog(context);
                                  },
                                  text: "Exit",
                                  textStyle: AppStyles.darkRegular20,
                                  svgIcon: AppAssets.exit,
                                  iconSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    //todo : show Watch list
                                    setState(() {
                                      selectedIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 40.h,
                                          height: 40.h,
                                          child: SvgPicture.asset(
                                            AppAssets.watchlist,
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          "Wish List",
                                          style: AppStyles.lightRegular20,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.h),
                                          height: 3.h,
                                          width: double.infinity,
                                          color: selectedIndex == 1
                                              ? AppColors.primaryYellowColor
                                              : AppColors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    //todo:show history
                                    setState(() {
                                      selectedIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.folder,
                                          height: 40.h,
                                          width: 40.w,
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          "History",
                                          style: AppStyles.lightRegular20,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.h),
                                          height: 3.h,
                                          width: double.infinity,
                                          color: selectedIndex == 2
                                              ? AppColors.primaryYellowColor
                                              : AppColors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 800.h,
                        child: selectedIndex == 0
                            ? Center(
                                child: Image.asset(
                                  AppAssets.empty,
                                  width: 124.w,
                                  height: 124.w,
                                ),
                              )
                            : selectedIndex == 1
                                ? WatchList()
                                : HistoryList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    DialogUtils.showMessage(
      context: context,
      title: 'Confirm Logout',
      message: 'Are you sure you want to logout?',
      posActionName: 'Yes',
      posAction: () async {
        await SharedPrefService.instance.clearToken();
        Navigator.pushReplacementNamed(context, RouteNames.login);
      },
      negActionName: 'Cancel',
    );
  }
}
