import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/custom_elvated_button.dart';
import 'package:movies/core/utils/dialog_utils.dart';
import 'package:movies/presentation/profile/ui/cubit/profile_page_states.dart';
import 'package:movies/presentation/profile/ui/cubit/profile_page_view_model.dart';
import 'package:movies/presentation/profile/ui/history_list.dart';
import 'package:movies/presentation/profile/ui/watch_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfilePageViewModel viewModel = getIt<ProfilePageViewModel>();
  int selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfilePageViewModel, ProfilePageStates>(
        bloc: viewModel,
        builder: (context, state) {
          // Debug print to see current state
          print("Current state: ${state.runtimeType}");
          
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
                      textStyle: AppStyles.darkGrayRegular20,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileSuccessState) {
            final user = state.getProfileResponseEntity.data;
            return SafeArea(
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
                                // User avatar
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    "assets/images/gamer ${user?.avaterId ?? 1}.png",
                                    width: 118.w,
                                    height: 118.h,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 118.w,
                                        height: 118.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryYellowColor,
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          size: 60.sp,
                                          color: AppColors.darkGray,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                // User name
                                Text(
                                  user?.name ?? "User Name",
                                  style: AppStyles.lightBold20,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  // Get actual wish list count from user data
                                  "12",
                                  style: AppStyles.lightBold24,
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  "Wish List",
                                  style: AppStyles.lightRegular16,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  // Get actual history count from user data
                                  "12",
                                  style: AppStyles.lightBold24,
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  "History",
                                  style: AppStyles.lightRegular16,
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
                                  Navigator.pushNamed(
                                      context, RouteNames.profileUpdate);
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
                                  _showExitDialog(context);
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
                              child: _buildTabButton(
                                index: 1,
                                icon: AppAssets.watchlist,
                                title: "Wish List",
                                isSelected: selectedIndex == 1,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: _buildTabButton(
                                index: 2,
                                icon: AppAssets.folder,
                                title: "History",
                                isSelected: selectedIndex == 2,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      child: _buildContent(),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Handle initial/unknown state - show loading instead of black screen
            return const SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildTabButton({
    required int index,
    required String icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            icon,
            height: 40.h,
            width: 40.w,
            color: isSelected ? AppColors.primaryYellowColor : AppColors.light,
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: isSelected 
                ? AppStyles.lightRegular16.copyWith(color: AppColors.primaryYellowColor)
                : AppStyles.lightRegular16,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            height: 3.h,
            width: double.infinity,
            color: isSelected
                ? AppColors.primaryYellowColor
                : AppColors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 1:
        return const WatchList();
      case 2:
        return const HistoryList();
      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.empty,
                width: 124.w,
                height: 124.h,
              ),
              SizedBox(height: 16.h),
              Text(
                "Select a tab to view content",
                style: AppStyles.lightRegular16,
              ),
            ],
          ),
        );
    }
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.darkGray,
          title: Text(
            'Exit App',
            style: AppStyles.lightBold20,
          ),
          content: Text(
            'Are you sure you want to exit the app?',
            style: AppStyles.lightRegular16,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppStyles.lightRegular16,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add exit app functionality
                // SystemNavigator.pop(); // Uncomment to actually exit
              },
              child: Text(
                'Exit',
                style: AppStyles.lightRegular16.copyWith(color: AppColors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }
}