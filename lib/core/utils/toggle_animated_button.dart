import 'dart:async';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class ToggleAnimatedButton extends StatelessWidget {
  final bool currentState;
  final Widget flag1;
  final Widget flag2;
  final FutureOr<void> Function(bool) onChanged;

  const ToggleAnimatedButton({
    super.key,
    required this.flag1,
    required this.flag2,
    required this.onChanged,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: currentState,
      first: true,
      second: false,
      spacing: 8.sp,
      height: 38.sp,
      style: ToggleStyle(
        borderColor: AppColors.primaryYellowColor,
        borderRadius: BorderRadius.circular(30),
        backgroundColor: Colors.transparent,
        indicatorColor: AppColors.primaryYellowColor,
      ),
      onChanged: onChanged,
      iconBuilder: (val) => val ? flag1 : flag2,
    );
  }
}
