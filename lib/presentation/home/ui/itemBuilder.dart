import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';

class ItemBuilder extends StatelessWidget {
   ItemBuilder({
    super.key,
    required this.slider,
    required this.index,
    this.newithdth=0,
  });

  final List<String> slider;
  final int index;
  double newithdth=0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.asset(slider[index],
              fit: BoxFit.cover, width: double.infinity ),
          // Rating Badge
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text("7.7",
                      style: TextStyle(
                          color: AppColors.light, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Icon(Icons.star,
                      color: AppColors.primaryYellowColor, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}//LocaleKeys.onboarding_explore_button.tr()
