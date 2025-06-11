import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/custom_elvated_button.dart';
import 'package:movies/presentation/profile/ui/history_list.dart';
import 'package:movies/presentation/profile/ui/watch_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int slectedIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                            AppAssets.profilePic1,
                            width: 118.w,
                            height: 118.h,
                          ),
                          SizedBox(height: 15.h),
                          //todo: get name
                          Text(
                            'Ahmed Rajeh',
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
                            //todo: navigate to edit profile
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
                              slectedIndex = 1;
                            });
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  AppAssets.watchlist,
                                  height: 40.h,
                                  width: 40.w,
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
                                  color: slectedIndex == 1
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
                              slectedIndex = 2;
                            });
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
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
                                  color: slectedIndex == 2
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
              child: Container(
                width: double.infinity,
                height: 800.h,
                child: slectedIndex == 0
                    ? Center(
                        child: Image.asset(
                          AppAssets.empty,
                          width: 124.w,
                          height: 124.w,
                        ),
                      )
                    : slectedIndex == 1
                        ? WatchList()
                        : HistoryList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
