import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          (index) => 'assets/svg/gamer ${index + 1}.svg',
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
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                avatars[index],
                width: 50.sp,
                height: 50.sp,
                placeholderBuilder: (context) =>
                const CircularProgressIndicator(),
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
