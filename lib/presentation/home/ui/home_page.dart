import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/movie_card.dart';
import 'package:movies/generated/locale_keys.g.dart';
import 'package:movies/presentation/home/SliderBuilder.dart';
import 'package:movies/presentation/home/ui/list_viwe_item.dart';
import 'package:movies/presentation/movie%20details/ui/movie_details.dart';
import '../../../core/model/movies_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> slider = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
    AppAssets.onBoarding4,
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
    AppAssets.onBoarding4
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                image:
                    DecorationImage(image: AssetImage(AppAssets.onBoarding6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                    vertical: height * 0.03,
                  ),
                  margin: EdgeInsets.only(
                    top: height * 0.04,
                    bottom: height * 0.02,
                  ),
                  child: Image.asset(AppAssets.available),
                ),
                SliderBuilder(height: height, slider: slider),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                    vertical: height * 0.02,
                  ),
                  margin: EdgeInsets.only(
                    top: height * 0.02,
                    bottom: height * 0.02,
                  ),
                  child: Image.asset(AppAssets.watchNow),
                ),
                Row(
                  children: [
                    Text(
                      "Action Type",
                      style: AppStyles.lightRegular20,
                    ),
                    Spacer(),
                    Text(
                      "see more",
                      style: AppStyles.primaryRegular16,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: AppColors.primaryYellowColor,
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: height * 0.02),
                    height: height * 0.2,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: slider.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            MoviePosterCard(
                              width: 150.sp,
                              height: 250.sp,
                              movie: Movies(
                                mediumCoverImage:
                                    "https://yts.mx/assets/images/movies/bhool_chuk_maaf_2025/large-cover.jpg",
                                rating: 8.8,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    RouteNames.movieDetails); //edit this part
                                // TODO: Navigate to Movie Details Screen
                              },
                            ),
                            SizedBox(
                              width: 15.sp,
                            )
                          ],
                        );

                        // If you want to use a different item widget:
                        // return ListViewItem(width: width, slider: slider, index: index);
                      },
                    ))
              ],
            )));
  }
}
