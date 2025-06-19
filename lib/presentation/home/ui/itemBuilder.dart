import 'package:flutter/material.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:movies/core/utils/movie_card.dart';

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

    return MoviePosterCard(
      movie: slider[index],
      // imageUrl: slider[index].mediumCoverImage ?? '',
      width: double.infinity,
      height: double.infinity,
    );
  }
}
