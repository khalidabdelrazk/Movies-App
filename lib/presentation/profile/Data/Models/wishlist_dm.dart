import 'package:movies/presentation/profile/Domain/entitys/wishlist_entity.dart';

class WishlistDm extends WishlistEntity {
  WishlistDm({
    super.message,
    super.data,
    super.error,
  });

  WishlistDm.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataWishlistDm.fromJson(v));
      });
    }
  }
}

class DataWishlistDm extends DataWishlistEntity {
  DataWishlistDm({
    super.movieId,
    this.name,
    super.rating,
    super.imageURL,
    this.year,
  });

  DataWishlistDm.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }
  String? name;

  String? year;
}
