import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/custom_button.dart';
import 'package:movies/generated/locale_keys.g.dart';
import 'package:movies/main.dart';

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
      key: introKey ,
      pages: [
        PageViewModel(
          titleWidget: Container(

          ),
          backgroundImage: AppAssets.onBoarding1,
          bodyWidget: Container(
      
              margin: EdgeInsets.only(top: height * 0.10),
            child: Column(
              children: [
                 Text(LocaleKeys.onboarding_onboarding_1_title.tr(),style: AppStyles.lightMedium36,
                  textAlign: TextAlign.center,),
                  SizedBox(height: height * 0.02,),
                  Text(LocaleKeys.onboarding_onboarding_1_description.tr(),
                  style: AppStyles.darkGrayRegular20,),
                  SizedBox(height: height * 0.03,),
                  
                  CustomButton(body: Text(LocaleKeys.onboarding_explore_button.tr(),style: AppStyles.darkSemiBold20,),
                  backgroundColor: null ,color: AppColors.primaryYellowColor,onPressed: (){
                    introKey.currentState?.next();
                  }),

              ],
            ),
          )
        ),

       PageViewModel(
          titleWidget: Container(
          ),
          backgroundImage: AppAssets.onBoarding2,
          bodyWidget: Container(
              margin: EdgeInsets.only(top: height * 0.13),
            child: Column(
              children: [
                 Text(LocaleKeys.onboarding_onboarding_2_title.tr(),style: AppStyles.lightMedium36,
                  textAlign: TextAlign.center,),
                  SizedBox(height: height * 0.02,),
                  Text(LocaleKeys.onboarding_onboarding_2_description.tr(),
                  style: AppStyles.darkGrayRegular20,),
                  SizedBox(height: height * 0.03,),
                  
                  CustomButton(body: Text(LocaleKeys.onboarding_next_button.tr(),style: AppStyles.darkSemiBold20,),
                  backgroundColor: null ,color: AppColors.primaryYellowColor,onPressed: (){
                    introKey.currentState?.next();
                  }),

              ],
            ),
          )
        ),
         

         PageViewModel(
          titleWidget: Container(
         
          ),
          backgroundImage: AppAssets.onBoarding3,
          bodyWidget: Container(
              margin: EdgeInsets.only(top: height * 0.09),
            child: Column(
              children: [
                 Text(LocaleKeys.onboarding_onboarding_3_title.tr(),style: AppStyles.lightMedium36,
                  textAlign: TextAlign.center,),
                  // SizedBox(height: height * 0.02,),
                  Text(LocaleKeys.onboarding_onboarding_3_description.tr(),
                  style: AppStyles.darkGrayRegular20,),
                  SizedBox(height: height * 0.03,),
                  
                  CustomButton(body: Text(LocaleKeys.onboarding_next_button.tr(),style: AppStyles.darkSemiBold20,),
                  backgroundColor: null ,color: AppColors.primaryYellowColor,onPressed: (){
                    introKey.currentState?.next();
                  }),
                  SizedBox(height: height * 0.02,),
                  CustomButton(body: Text(LocaleKeys.onboarding_back_button.tr(),style: AppStyles.primaryBold20,),
                  backgroundColor: AppColors.darkGray ,color: null,onPressed: (){
                    introKey.currentState?.previous();
                  },borderRadius: 2,),

              ],
            ),
          )
        ),

         PageViewModel(
          titleWidget: Container(
          ),
          backgroundImage: AppAssets.onBoarding4,
          bodyWidget: Container(
              margin: EdgeInsets.only(top: height * 0.09),
            child: Column(
              children: [
                 Text(LocaleKeys.onboarding_onboarding_4_title.tr(),style: AppStyles.lightMedium36,
                  textAlign: TextAlign.center,),
                  // SizedBox(height: height * 0.02,),
                  Text(LocaleKeys.onboarding_onboarding_4_description.tr(),
                  style: AppStyles.darkGrayRegular20,),
                  SizedBox(height: height * 0.03,),
                  
                  CustomButton(body: Text(LocaleKeys.onboarding_next_button.tr(),style: AppStyles.darkSemiBold20,),
                  backgroundColor: null ,color: AppColors.primaryYellowColor,onPressed: (){
                    introKey.currentState?.next();
                  }),
                  SizedBox(height: height * 0.02,),
                  CustomButton(body: Text(LocaleKeys.onboarding_back_button.tr(),style: AppStyles.primaryBold20,),
                  backgroundColor: AppColors.darkGray ,color: null,onPressed: (){
                    introKey.currentState?.previous();
                  },borderRadius: 2,),

              ],
            ),
          )
        ),

         PageViewModel(
          titleWidget: Container(
            width: double.infinity,
          ),
          backgroundImage: AppAssets.onBoarding5,
          bodyWidget: Container(
              margin: EdgeInsets.only(top: height * 0.09),
            child: Column(
              children: [
                 Text(LocaleKeys.onboarding_onboarding_5_title.tr(),style: AppStyles.lightMedium36,
                  textAlign: TextAlign.center,),
                  SizedBox(height: height * 0.02,),
                  Text(LocaleKeys.onboarding_onboarding_5_description.tr(),
                  style: AppStyles.darkGrayRegular20,),
                  SizedBox(height: height * 0.03,),
                  
                  CustomButton(body: Text(LocaleKeys.onboarding_next_button.tr(),style: AppStyles.darkSemiBold20,),
                  backgroundColor: null ,color: AppColors.primaryYellowColor,onPressed: (){
                    introKey.currentState?.next();
                  }),
                  SizedBox(height: height * 0.02,),
                  CustomButton(body: Text(LocaleKeys.onboarding_back_button.tr(),style: AppStyles.primaryBold20,),
                  backgroundColor: AppColors.darkGray ,color: null,onPressed: (){
                    introKey.currentState?.previous();
                  },borderRadius: 2,),

              ],
            ),
          )
        ),

         PageViewModel(
          titleWidget: Container(
            width: double.infinity,
          ),
          backgroundImage: AppAssets.onBoarding6,
          bodyWidget: Container(
              margin: EdgeInsets.only(top: height * 0.15),
            child: Column(
              children: [
                 Text(LocaleKeys.onboarding_onboarding_6_button.tr(),style: AppStyles.lightMedium36,
                  textAlign: TextAlign.center,),
                 
                
                  SizedBox(height: height * 0.03,),
                  
                  CustomButton(body: Text(LocaleKeys.onboarding_finish_button.tr(),style: AppStyles.darkSemiBold20,),
                  backgroundColor: null ,color: AppColors.primaryYellowColor,onPressed: (){
                    Navigator.pushNamed(context, RouteNames.login);
                  }),
                  SizedBox(height: height * 0.02,),
                  CustomButton(body: Text(LocaleKeys.onboarding_back_button.tr(),style: AppStyles.primaryBold20,),
                  backgroundColor: AppColors.darkGray ,color: null,onPressed: (){
                    introKey.currentState?.previous();
                  },borderRadius: 2,),

              ],
            ),
          )
        ),
        
      ],
     
       
       
       
       
      showNextButton: false,
      showDoneButton: false,
      showBackButton: false,
     );
  }
}
