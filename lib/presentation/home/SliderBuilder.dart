import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/presentation/home/ui/itemBuilder.dart';

class SliderBuilder extends StatelessWidget {
  const SliderBuilder({
    super.key,
    required this.height,
    required this.slider,
  });

  final double height;
  final List<Movies> slider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 351.h,
        enlargeCenterPage: true,
        viewportFraction: 0.65,
        enableInfiniteScroll: true,
      ),
      itemCount: slider.length,
      itemBuilder: (context, index, pageIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              // BoxShadow(
              //   color: AppColors.black,
              //   blurRadius: 8,
              //   offset: Offset(0, 4),
              // ),
            ],
          ),
          child: ItemBuilder(slider: slider, index: index),
        );
      },
    );
  }
}
