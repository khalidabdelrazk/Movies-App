import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:movies/presentation/profile/ui/cubit/profile_page_states.dart';

import '../../../core/di/di.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/utils/custom_elvated_button.dart';
import '../../../core/utils/movie_card.dart';
import 'cubit/profile_page_view_model.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  ProfilePageViewModel viewModel = getIt<ProfilePageViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProfileErrorState) {
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: AppColors.red,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Error',
                    style: AppStyles.lightBold24,
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Text(
                      state.failures.errorMessage,
                      style: AppStyles.lightRegular16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomElvatedButton(
                    onPressed: () => viewModel.getData(),
                    text: 'Retry',
                    backgroundColor: AppColors.primaryYellowColor,
                    textStyle: AppStyles.darkGrayRegular20,
                  ),
                ],
              ),
            ),
          );
        } else if (state is WishlistSuccessState) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 55),
            child: GridView.builder(
              itemCount: state.wishlistEntity.data!.length,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio:
                    198 / 279, // match MoviePosterCard aspect ratio
              ),
              itemBuilder: (context, index) {
                return MoviePosterCard(
                  width: 122.w,
                  height: 179.h,
                  movie: Movies(
                      rating: state.wishlistEntity.data![index].rating,
                      mediumCoverImage:
                          state.wishlistEntity.data![index].imageURL),
                  onPressed: () {
                    // todo: Navigate to details
                  },
                );
              },
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.green,
        );
      },
    );
  }
}
