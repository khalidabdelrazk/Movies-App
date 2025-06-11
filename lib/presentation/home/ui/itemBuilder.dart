import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:movies/core/theme/app_colors.dart';

class ItemBuilder extends StatelessWidget {
  ItemBuilder({
    super.key,
    required this.slider,
    required this.index,
    this.ratting = '',
  });

  final List<Movies> slider;
  final int index;
  String ratting;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: slider[index].mediumCoverImage ?? '',
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) {
              print('Error loading image: $error');
              return Container(
                color: Colors.black12,
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.broken_image, size: 40, color: AppColors.light),
                    SizedBox(height: 8),
                    Text('Image not available'),
                  ],
                ),
              );
            },
          ),
          // Rating Badge
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    '${slider[index].rating ?? ''}',
                    style: TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star,
                      color: AppColors.primaryYellowColor, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
