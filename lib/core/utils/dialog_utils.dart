import 'package:flutter/material.dart';
import '../theme/app_colors.dart';


class DialogUtils {
  static void showLoading(
      {required BuildContext context}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.darkGray,),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      String? posActionName,
      Function? posAction,
      String? negActionName,
      Function? negAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction != null){
            //   posAction.call();
            // }
            posAction?.call();
          },
          child: Text(
            posActionName,
            // style: AppStyles.light16White,
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,
              // style: AppStyles.medium18Header
          )));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              // style: AppStyles.light16White,
            ),
            title: Text(
              title ?? '',
              // style: AppStyles.light16White,
            ),
            actions: actions,
          );
        });
  }
}
