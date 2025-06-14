import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/shared_pref_services.dart';
import 'package:movies/generated/locale_keys.g.dart';
import 'package:movies/presentation/on%20boarding/ui/custom_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return IntroductionScreen(
      showBottomPart: false,
      key: introKey,
      rawPages: [
        MovieIntroScreen(
          backgroundImage: AppAssets.onBoarding1,
          color: AppColors.transparent,
          title: LocaleKeys.onboarding_onboarding_1_title.tr(),
          description: LocaleKeys.onboarding_onboarding_1_description.tr(),
          nextText: LocaleKeys.onboarding_explore_button.tr(),
          onNextPressed: () => introKey.currentState?.next(),
        ),
        MovieIntroScreen(
          backgroundImage: AppAssets.onBoarding2,
          title: LocaleKeys.onboarding_onboarding_2_title.tr(),
          description: LocaleKeys.onboarding_onboarding_2_description.tr(),
          nextText: LocaleKeys.onboarding_next_button.tr(),
          onNextPressed: () => introKey.currentState?.next(),
        ),
        MovieIntroScreen(
          backgroundImage: AppAssets.onBoarding3,
          title: LocaleKeys.onboarding_onboarding_2_title.tr(),
          description: LocaleKeys.onboarding_onboarding_3_description.tr(),
          nextText: LocaleKeys.onboarding_next_button.tr(),
          backText: LocaleKeys.onboarding_back_button.tr(),
          onNextPressed: () => introKey.currentState?.next(),
          onBackPressed: () => introKey.currentState?.previous(),
        ),
        MovieIntroScreen(
          backgroundImage: AppAssets.onBoarding4,
          title: LocaleKeys.onboarding_onboarding_2_title.tr(),
          description: LocaleKeys.onboarding_onboarding_4_description.tr(),
          nextText: LocaleKeys.onboarding_next_button.tr(),
          backText: LocaleKeys.onboarding_back_button.tr(),
          onNextPressed: () => introKey.currentState?.next(),
          onBackPressed: () => introKey.currentState?.previous(),
        ),
        MovieIntroScreen(
          backgroundImage: AppAssets.onBoarding5,
          title: LocaleKeys.onboarding_onboarding_5_title.tr(),
          description: LocaleKeys.onboarding_onboarding_2_description.tr(),
          nextText: LocaleKeys.onboarding_next_button.tr(),
          backText: LocaleKeys.onboarding_back_button.tr(),
          onNextPressed: () => introKey.currentState?.next(),
          onBackPressed: () => introKey.currentState?.previous(),
        ),
        MovieIntroScreen(
          backgroundImage: AppAssets.onBoarding6,
          title: LocaleKeys.onboarding_onboarding_6_button.tr(),
          nextText: LocaleKeys.onboarding_finish_button.tr(),
          backText: LocaleKeys.onboarding_back_button.tr(),
          onNextPressed: () async {
            introKey.currentState?.next();
            await SharedPrefService.instance.setOnboardingViewed(true);
            Navigator.pushReplacementNamed(
                context, isLoggedIn ? RouteNames.root : RouteNames.login);
          },
          onBackPressed: () => introKey.currentState?.previous(),
        ),
      ],
      showNextButton: false,
      showDoneButton: false,
      showBackButton: false,
    );
  }

  bool get isLoggedIn => SharedPrefService.instance.getToken() != null;
}
