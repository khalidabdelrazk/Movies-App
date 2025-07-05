import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/theme/app_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/movie_card.dart';
import '../../search/data/movie_repository.dart';
import '../cubit/movie_browse_cubit.dart';
import '../cubit/movie_browse_state.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBrowseCubit(MovieRepository())..loadMovies(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<MovieBrowseCubit, MovieBrowseState>(
                  builder: (context, state) {
                    if (state is MovieBrowseSuccess) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.genres.map((genre) {
                            final isSelected = genre == state.selectedGenre;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<MovieBrowseCubit>().filterByGenre(genre);
                                },
                                child: Container(
                                  padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    color: isSelected ?AppColors.primaryYellowColor  : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color:AppColors.primaryYellowColor ,width: 1.5.h),
                                  ),
                                  child: Text(
                                    genre,
                                    style:
                                        isSelected ? AppStyles.blackBold20:AppStyles.primaryBold20,

                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<MovieBrowseCubit, MovieBrowseState>(
                    builder: (context, state) {
                      if (state is MovieBrowseLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is MovieBrowseSuccess) {
                        return GridView.builder(
                          itemCount: state.movies.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (context, index) {
                            final movie = state.movies[index];
                            return MoviePosterCard(
                              movie: movie,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.movieDetails,
                                  arguments: movie,
                                );
                              },
                            );
                          },
                        );
                      } else if (state is MovieBrowseError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
