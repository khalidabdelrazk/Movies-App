class WishlistEntity {
  WishlistEntity({
    this.message,
    this.data,
    this.error,
  });

  WishlistEntity.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataWishlistEntity.fromJson(v));
      });
    }
  }
  String? message;
  String? error;
  List<DataWishlistEntity>? data;
}

class DataWishlistEntity {
  DataWishlistEntity({
    this.movieId,
    this.rating,
    this.imageURL,
  });

  DataWishlistEntity.fromJson(dynamic json) {
    movieId = json['movieId'];
    rating = json['rating'];
    imageURL = json['imageURL'];
  }
  String? movieId;
  dynamic rating;
  String? imageURL;
}
