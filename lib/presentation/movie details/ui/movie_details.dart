import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/custom_Movie_cast.dart';
import 'package:movies/core/utils/custom_button.dart';
import 'package:movies/core/utils/custom_movie_rating.dart';
import 'package:movies/core/utils/custom_scran_shots.dart';
import 'package:movies/core/utils/movie_card.dart';
import 'package:movies/generated/locale_keys.g.dart';
import 'package:movies/presentation/movie%20details/ui/GenreChip.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movies = ModalRoute.of(context)!.settings.arguments as Movies;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500.r,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${movies.mediumCoverImage ?? ''}'),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: Offset(0, 8),
                      blurRadius: 16.r,
                      spreadRadius: 2.r,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Centered Play Button
                    Center(
                      child: CircleAvatar(
                        radius: 35.sp,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 30.sp,
                          backgroundColor: AppColors.primaryYellowColor,
                          child: SvgPicture.asset(
                            AppAssets.runMovie,
                            width: 28.sp,
                            height: 28.sp,
                          ),
                        ),
                      ),
                    ),

                    // Bottom Section: Button + Ratings
                    Positioned(
                      bottom: 20.h,
                      left: 16.w,
                      right: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                            onPressed: nothing,
                            color: AppColors.light,
                            backgroundColor: AppColors.red,
                            body: Text(
                              LocaleKeys.general_ui_Browse_watch_button.tr(),
                              style: AppStyles.lightBold20,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomMovieRating(
                                image: AppAssets.love,
                                movie: Movies(rating: 15),
                              ),
                              CustomMovieRating(
                                image: AppAssets.timer,
                                movie: Movies(runtime: movies.runtime!.toInt()),
                              ),
                              CustomMovieRating(
                                image: AppAssets.star,
                                movie: Movies(rating: movies.rating),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.r),
              Text(
                "Screen Shots",
                style: AppStyles.lightBold24,
              ),
              SizedBox(height: 12.r),
              CostumScreanShots(image: movies.backgroundImage ?? ''),
              SizedBox(height: 12.r),
              CostumScreanShots(image: movies.backgroundImage ?? ''),
              SizedBox(height: 12.r),
              CostumScreanShots(image: movies.backgroundImage ?? ''),
              SizedBox(height: 15.r),
              Text(
                "Similarty",
                style: AppStyles.lightBold24,
              ),
              SizedBox(height: 15.r),
              GridView.builder(
                padding: EdgeInsets.all(16.sp),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.sp,
                  crossAxisSpacing: 8.sp,
                  childAspectRatio: 150 / 200,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return MoviePosterCard(
                    width: 150.sp,
                    height: 250.sp,
                    movie: Movies(
                      mediumCoverImage:
                          "https://yts.mx/assets/images/movies/bhool_chuk_maaf_2025/large-cover.jpg",
                      rating: 7.7,
                    ),
                  );
                },
              ),
              SizedBox(height: 15.r),
              Text(
                "Summary",
                style: AppStyles.lightBold24,
              ),
              SizedBox(height: 15.r),
              Text(
                movies.descriptionFull ?? 'No descrition available',
                style: AppStyles.lightRegular16,
              ),
              Text(
                "Cast",
                style: AppStyles.lightBold24,
              ),
              SizedBox(height: 15.r),
              CustomMovieCast(
                  name: "Hayley Atwell", character: 'Captain Carter'),
              SizedBox(height: 15.r),
              CustomMovieCast(
                  name: "Hayley Atwell", character: 'Captain Carter'),
              SizedBox(height: 15.r),
              CustomMovieCast(
                  name: "Hayley Atwell", character: 'Captain Carter'),
              SizedBox(height: 15.r),
              Text(
                "Genres",
                style: AppStyles.lightBold24,
              ),
              SizedBox(height: 15.r),
              Column(
                children: [
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: const [
                      GenreChip(label: "Action"),
                      GenreChip(label: "Sci-Fi"),
                      GenreChip(label: "Adventure"),
                      GenreChip(label: "Fantasy"),
                      GenreChip(label: "Horror"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

void nothing() {}
