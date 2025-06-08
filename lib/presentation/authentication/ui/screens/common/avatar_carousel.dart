import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';

class AvatarCarousel extends StatefulWidget {
  final Function(int index) onAvatarSelected;

  const AvatarCarousel({super.key, required this.onAvatarSelected});

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  int selectedIndex = 0;
  late List<String> avatars;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    avatars = List.generate(
      9,
          (index) => 'assets/images/gamer ${index + 1}.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: avatars.length,
          options: CarouselOptions(
            height: 120.sp,
            enlargeCenterPage: true,
            viewportFraction: 0.4, // ✅ shows next & previous
            onPageChanged: (index, reason) {
              setState(() => selectedIndex = index);
              widget.onAvatarSelected(index);
            },
          ),
          itemBuilder: (context, index, realIdx) {
            print(avatars[index]);
            return CircleAvatar(
              radius: 40.sp,
              backgroundColor: AppColors.transparent,
              child: Image.asset(
                avatars[index],
                width: 50.sp,
                height: 50.sp,
              ),
            );
          },
        ),
        SizedBox(height: 8.sp),
        Text("Avatar", style: AppStyles.lightRegular16),
      ],
    );
  }
}
