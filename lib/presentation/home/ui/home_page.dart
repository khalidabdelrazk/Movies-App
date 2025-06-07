import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/movie_card.dart';
import 'package:movies/generated/locale_keys.g.dart';
import '../../../core/model/movies_response.dart';

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
          SizedBox(
            height: 100,
          ),
          Text(LocaleKeys.onboarding_explore_button.tr(),style: AppStyles.lightBold20,),
          Text(LocaleKeys.onboarding_explore_button.tr(),style: AppStyles.lightBold20.copyWith(
            fontSize: 20,
          ),),
          Text(LocaleKeys.authentication_confirm_password_label.tr()),
          Text('authentication.confirm_password_label'.tr(),style: AppStyles.lightBold20,),
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
          MoviePosterCard(
            movie: Movies(
                mediumCoverImage:
                    "https://yts.mx/assets/images/movies/bhool_chuk_maaf_2025/large-cover.jpg",
                rating: 8.8),
            onPressed: () {
              // todo => Navigate to Movie detailed Screen
            },
          )
        ],
      ),
    );
  }
}
