import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/presentation/home/MovieStates/states.dart';
import 'package:movies/presentation/home/SliderBuilder.dart';
import 'package:movies/presentation/home/cubits/MovieCubit.dart';
import 'package:movies/core/model/movies_response.dart';

import '../../../core/utils/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesCubit viewModel = MoviesCubit();

  @override
  void initState() {
    super.initState();
    viewModel.fetchMovies();
  }

  // Extract unique genres
  List<String> getGenres(List<Movies> movies) {
    final genresSet = <String>{};
    for (var movie in movies) {
      genresSet.addAll(movie.genres ?? []);
    }
    return genresSet.toList();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesError) {
            return Center(
              child: Text(state.message, style: AppStyles.primaryRegular16),
            );
          } else if (state is MoviesSucess) {
            final movies = state.movies;
            final genres = getGenres(movies);

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(AppAssets.onBoarding6),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.04),
                      Image.asset(AppAssets.available, width: 267.w, height: 93.h),
                      SizedBox(height: height * 0.03),
                      SliderBuilder(height: height, slider: movies),
                      SizedBox(height: height * 0.03),
                      Image.asset(AppAssets.watchNow, width: 267.w, height: 93.h),
                      SizedBox(height: height * 0.02),

                      // Genre sections
                      ...genres.map((genre) {
                        final genreMovies = movies
                            .where((movie) => movie.genres?.contains(genre) ?? false)
                            .toList();

                        return Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Genre header
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  children: [
                                    Text(genre, style: AppStyles.lightRegular20),
                                    const Spacer(),
                                    Text("See More", style: AppStyles.primaryRegular16),
                                    Icon(Icons.arrow_forward,
                                        size: 20.sp,
                                        color: AppColors.primaryYellowColor),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),

                              // Movies in this genre
                              SizedBox(
                                height: 260.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: genreMovies.length,
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  itemBuilder: (context, index) {
                                    final movie = genreMovies[index];
                                    return Padding(
                                      padding: EdgeInsets.only(right: 12.w),
                                      child: MoviePosterCard(
                                        width: 150.w,
                                        height: 250.h,
                                        movie: movie,
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            RouteNames.movieDetails,
                                            arguments: movie,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),

                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            );
          }

          return const Center(child: Text("Something went wrong."));
        },
      ),
    );
  }
}
