import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_styles.dart';

class MovieIntroScreen extends StatelessWidget {
  final String? backgroundImage;
  final String? title;
  final String? description;
  final String? nextText;
  final String? backText;
  final VoidCallback? onNextPressed;
  final VoidCallback? onBackPressed;
  final Color? color;

  const MovieIntroScreen({
    super.key,
    this.color,
    this.backgroundImage,
    this.title,
    this.description,
    this.nextText,
    this.backText,
    this.onNextPressed,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background image
          if (backgroundImage != null)
            SizedBox.expand(
              child: Image.asset(
                backgroundImage!,
                fit: BoxFit.cover,
              ),
            ),

          /// Overlay content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: color ?? Colors.black.withOpacity(0.85),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: AppStyles.lightMedium36,
                      textAlign: TextAlign.center,
                    ),
                  if (description != null) ...[
                    SizedBox(height: 12.h),
                    Text(
                      description!,
                      style:  AppStyles.darkGrayRegular20,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  SizedBox(height: 20.h),

                  /// Buttons
                  Column(
                    children: [
                      if (nextText != null && onNextPressed != null)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: onNextPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                            child: Text(
                              nextText!,
                              style: AppStyles.darkSemiBold20,
                            ),
                          ),
                        ),
                      if (backText != null && nextText != null)
                        SizedBox(height: 12.h),
                      if (backText != null && onBackPressed != null)
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: onBackPressed,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.amber, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text(
                              backText!,
                              style: AppStyles.primaryBold20,
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
