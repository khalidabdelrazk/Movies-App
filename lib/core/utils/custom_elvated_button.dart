import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/theme/app_styles.dart';

class CustomElvatedButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final String? svgIcon; // SVG asset path
  final Color? iconColor; // SVG icon color
  final double? iconSize;

  const CustomElvatedButton({
    super.key,
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.borderColor,
    this.svgIcon,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          side: BorderSide(
            color: borderColor ?? Colors.transparent, 
            width: 2
          ),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: textStyle ?? AppStyles.lightBold20,
            ),
            if (svgIcon != null) ...[
              SizedBox(width: 10.w),
              SvgPicture.asset(
                svgIcon!,
                width: iconSize ?? 24,
                height: iconSize ?? 24,
                colorFilter: iconColor != null 
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}