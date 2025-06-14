import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/utils/movie_card.dart';
import 'package:movies/presentation/home/MovieStates/states.dart';
import 'package:movies/presentation/home/SliderBuilder.dart';
import 'package:movies/presentation/home/cubits/MovieCubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesCubit viewModel = MoviesCubit();
  int newIndex = 0;

  // List<String> slider = [
  //   AppAssets.onBoarding1,
  //   AppAssets.onBoarding2,
  //   AppAssets.onBoarding3,
  //   AppAssets.onBoarding4,
  // ];

  @override
  void initState() {
    super.initState();
    viewModel.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesError) {
            return Center(
              child: Text(
                state.message,
                style: AppStyles.primaryRegular16,
              ),
            );
          } else if (state is MoviesSucess) {
            final movies = state.movies;
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
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.04),
                      Image.asset(AppAssets.available,width: 267.w,height: 93.h,),
                      SizedBox(height: height * 0.03),
                      SliderBuilder(height: height, slider: state.movies),
                      SizedBox(height: height * 0.03),
                      SizedBox(width: 267.w,height: 93.h,child: Image.asset(AppAssets.watchNow,)),
                      SizedBox(height: height * 0.02),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${state.movies[newIndex].genres ?? ''}',
                                  style: AppStyles.lightRegular20,
                                ),
                                const Spacer(),
                                Text(
                                  "See more",
                                  style: AppStyles.primaryRegular16,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                  color: AppColors.primaryYellowColor,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 260.sp,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: movies.length,
                                itemBuilder: (context, index) {
                                  newIndex = index;
                                  final movie = movies[index];
                                  return Row(
                                    children: [
                                      MoviePosterCard(
                                        width: 150.sp,
                                        height: 250.sp,
                                        movie: movie,
                                        onPressed: () {
                                          if (movies[index].genres !=
                                              movies[newIndex].genres) {
                                            setState(() {
                                              newIndex = index;
                                            });
                                          }
                                          Navigator.of(context)
                                              .pushNamed(RouteNames.movieDetails);
                                        },
                                      ),
                                      SizedBox(width: 15.sp),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 55,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            // Optional fallback
            return const Center(child: Text("Something went wrong."));
          }
        },
      ),
    );
  }

  void changeGrenIndex(int index) {
    setState(() {
      newIndex = index;
    });
  }
}
