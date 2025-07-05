import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/routes/route_names.dart';
import '../../../core/utils/movie_card.dart';
import '../cubit/movie_search_cubit.dart';
import '../data/movie_repository.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieSearchCubit(MovieRepository()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    
                    _buildSearchField(context),
                     SizedBox(height: 12.h),
                    Expanded(child: _buildSearchResults(context))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return
      TextField(
      controller: controller,
      style: TextStyle(color: AppColors.light),
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle:  TextStyle(color:AppColors.light),
        filled: true,
        fillColor: AppColors.darkGray,
        prefixIcon:  Icon(Icons.search, color: AppColors.light),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {
        if (value.trim().isEmpty) {
          context.read<MovieSearchCubit>().reset();
        } else {
          context.read<MovieSearchCubit>().search(value.trim());
        }
      },
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    return BlocBuilder<MovieSearchCubit, MovieSearchState>(
      builder: (context, state) {
        if (state is MovieSearchInitial) {
          return Center(
            child: Image.asset(AppAssets.empty, width: 200.w),
          );
        } else if (state is MovieSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieSearchSuccess) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return  Center(
              child: Text("No results found", style: TextStyle(color: AppColors.light)),
            );
          }
          return GridView.builder(
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final movie = movies[index];
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
        } else if (state is MovieSearchError) {
          return Center(
            child: Text(state.message, style:  TextStyle(color:AppColors.red)),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
