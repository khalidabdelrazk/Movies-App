import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/presentation/authentication/Domain/Entity/failures.dart';
import 'package:movies/presentation/profile/Domain/entitys/wishlist_entity.dart';
import 'package:movies/presentation/profile/Domain/repository/wishlist_repository.dart';

@injectable
class WishlistUseCase {
  WishlistRepository wishlistRepository;
  WishlistUseCase({required this.wishlistRepository});

  Future<Either<Failures, WishlistEntity>> invoke() {
    return wishlistRepository.getWishlist();
  }
}
