import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';

import '../../../../../core/theme/app_colors.dart';

class AvatarCarousel extends StatefulWidget {
  final Function(int index) onAvatarSelected;

  const AvatarCarousel({super.key, required this.onAvatarSelected});

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  int selectedIndex = 0;

  List<String> avatars = List.generate(
    9,
    (index) => 'assets/svg/gamer ${index + 1}.svg',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: avatars.length,
          options: CarouselOptions(
            height: 120.sp,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() => selectedIndex = index);
              widget.onAvatarSelected(index);
            },
          ),
          itemBuilder: (context, index, realIdx) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == index
                      ? AppColors.primaryYellowColor
                      : Colors.transparent,
                  width: 3.sp,
                ),
              ),
              child: CircleAvatar(
                radius: 40.sp,
                // backgroundColor: Colors.black,
                child: SvgPicture.string(
                  AppAssets.profilePic1,
                  width: 50.sp,
                  height: 50.sp,
                  placeholderBuilder: (context) => const CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 8.sp),
        Text("Avatar", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
      ],
    );
  }
}
