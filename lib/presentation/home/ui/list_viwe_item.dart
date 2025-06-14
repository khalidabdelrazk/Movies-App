import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';

class ListViweItem extends StatelessWidget {
  ListViweItem(
      {super.key,
      required this.width,
      required this.slider,
      required this.index});

  final double width;
  final List<String> slider;
  int index;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.04,
      ),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.asset(slider[index], fit: BoxFit.cover),
              SizedBox(
                width: width * 0.02,
              ),
              Positioned(
                top: 10,
                left: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: height * 0.005),
                  decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text("7.7",
                          style: TextStyle(
                              color: AppColors.light,
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.star,
                          color: AppColors.primaryYellowColor, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
