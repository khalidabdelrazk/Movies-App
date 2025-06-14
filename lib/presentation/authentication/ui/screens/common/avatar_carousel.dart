import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/generated/locale_keys.g.dart';

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
            height: 161.sp,
            enlargeCenterPage: true,

            viewportFraction: 0.38,
            onPageChanged: (index, reason) {
              setState(() => selectedIndex = index);
              widget.onAvatarSelected(index);
            },
          ),
            itemBuilder: (context, index, realIdx) {
              final bool isSelected = index == selectedIndex;

              return AnimatedScale(
                scale: isSelected ? 1 : 0.8,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: ClipOval(
                  child: Container(
                    width: 158.sp ,
                    height: 161.sp ,
                    color: AppColors.transparent,
                    child: Image.asset(
                      avatars[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            }
        ),
        SizedBox(height: 8.sp),
        Text(LocaleKeys.profile_settings_avatar_label.tr(), style: AppStyles.lightRegular16),
        SizedBox(height: 8.sp),
      ],
    );
  }
}