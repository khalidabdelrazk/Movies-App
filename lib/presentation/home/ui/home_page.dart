import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/generated/locale_keys.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 100,),
          Text(LocaleKeys.profile_settings_avatar_label.tr()),
          Text(LocaleKeys.onboarding_explore_button.tr()),
          Text(LocaleKeys.authentication_confirm_password_label.tr()),
          ElevatedButton(
            onPressed: () {
              if (context.locale == Locale('en')) {
                context.setLocale(Locale('ar'));
              } else {
                context.setLocale(Locale('en'));
              }
              setState(() {});
            },
            child: Text("press"),
          ),
        ],
      ),
    );
  }
}
