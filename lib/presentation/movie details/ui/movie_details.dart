import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:movies/presentation/home/cubits/MovieCubit.dart';
import 'package:movies/presentation/movie%20details/ui/watch_movie_screen.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, this.movie, this.similarMovies});

  final Movies? movie;
  final List<Movies>? similarMovies;

  void _launchMovieUrl(BuildContext context) {
    try {
      final url = movie?.url?.isNotEmpty == true
          ? movie?.url
          : null;

      if (url != null && (url.startsWith('http') || url.startsWith('https'))) {
        print("Launching movie URL: $url");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WatchMovieScreen(movie: movie!),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No valid video URL available')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error launching video: \$e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final castList = movie?.cast ?? [];

    final filteredSimilar = (similarMovies ?? [])
        .where((m) =>
            m.id != movie?.id &&
            m.genres?.any((g) => movie?.genres?.contains(g) ?? false) == true)
        .take(4)
        .toList();

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
                    image: NetworkImage(
                      (movie?.backgroundImageOriginal?.startsWith('http') ??
                              false)
                          ? movie!.backgroundImageOriginal!
                          : AppAssets.onBoarding2,
                    ),
                    fit: BoxFit.cover,
                    onError: (error, stackTrace) =>
                        const Icon(Icons.broken_image),
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
                    Positioned(
                      bottom: 20.h,
                      left: 16.w,
                      right: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                            onPressed: () => _launchMovieUrl(context),
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
                                movie: Movies(
                                    rating: movie?.likeCount?.toDouble() ?? 0),
                              ),
                              CustomMovieRating(
                                image: AppAssets.timer,
                                movie: Movies(
                                    rating: movie?.runtime?.toDouble() ?? 90),
                              ),
                              CustomMovieRating(
                                image: AppAssets.star,
                                movie: Movies(rating: movie?.rating ?? 7.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.r),
              Text("Screen Shots", style: AppStyles.lightBold24),
              SizedBox(height: 12.r),
              CostumScreanShots(
                image: (movie?.mediumCoverImage?.startsWith('http') ?? false)
                    ? movie!.mediumCoverImage!
                    : AppAssets.onBoarding2,
              ),
              SizedBox(height: 20.r),
              Text("Similar Movies", style: AppStyles.lightBold24),
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
                itemCount: filteredSimilar.length,
                itemBuilder: (context, index) {
                  final similar = filteredSimilar[index];
                  return MoviePosterCard(
                    width: 150.sp,
                    height: 250.sp,
                    movie: similar,
                    onPressed: () async {
                      try {
                        if (similar.id != null) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => const Center(
                                child: CircularProgressIndicator()),
                          );
                          final viewModel = MoviesCubit();
                          final newDetails =
                              await viewModel.fetchMovieDetails(similar.id!);
                          Navigator.pop(context);

                          if (newDetails != null) {
                            final updatedSimilar = (similarMovies ?? [])
                                .where((m) => m.id != newDetails.id)
                                .toList();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetails(
                                  movie: newDetails,
                                  similarMovies: updatedSimilar,
                                ),
                              ),
                            );
                          }
                        }
                      } catch (e) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Error loading movie details: \$e')),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 15.r),
              Text("Summary", style: AppStyles.lightBold24),
              SizedBox(height: 15.r),
              Text(
                movie?.descriptionFull?.isNotEmpty == true
                    ? movie!.descriptionFull!
                    : movie?.summary?.isNotEmpty == true
                        ? movie!.summary!
                        : "No summary available.",
                style: AppStyles.lightRegular16,
              ),
              SizedBox(height: 15.r),
              Text("Cast", style: AppStyles.lightBold24),
              SizedBox(height: 12.r),
              if (castList.isNotEmpty)
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: castList
                      .map((c) => CustomMovieCast(
                            name: c.name ?? "Unknown",
                            character: c.characterName ?? "N/A",
                            image: (c.image?.startsWith('http') ?? false)
                                ? c.image!
                                : AppAssets.onBoarding3,
                          ))
                      .toList(),
                )
              else
                Text("No cast info available", style: AppStyles.lightRegular16),
              SizedBox(height: 20.r),
              Text("Genres", style: AppStyles.lightBold24),
              SizedBox(height: 10.r),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children:
                    movie?.genres?.map((g) => GenreChip(label: g)).toList() ??
                        [GenreChip(label: "Unknown")],
              ),
              SizedBox(height: 30.r),
            ],
          ),
        ),
      ],
    );
  }
}
