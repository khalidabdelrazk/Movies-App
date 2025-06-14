// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../presentation/authentication/Data/Data%20Sources/remote/auth_remote_data_source.dart'
    as _i293;
import '../../presentation/authentication/Data/Data%20Sources/remote/impl/auth_remote_data_source_impl.dart'
    as _i1054;
import '../../presentation/authentication/Data/Repository/auth_repository_impl.dart'
    as _i659;
import '../../presentation/authentication/Domain/Repository/auth_repository.dart'
    as _i471;
import '../../presentation/authentication/Domain/Use%20Case/auth_use_case.dart'
    as _i105;
import '../../presentation/authentication/ui/cubit/authentication/auth_view_model.dart'
    as _i212;
import '../../presentation/profile/Data/Data%20Sources/remote/get_profile_remote_data_source.dart'
    as _i182;
import '../../presentation/profile/Data/Data%20Sources/remote/get_wishlist_remote_data_source.dart'
    as _i345;
import '../../presentation/profile/Data/Data%20Sources/remote/impl/get_profile_remote_data_source_impl.dart'
    as _i104;
import '../../presentation/profile/Data/Data%20Sources/remote/impl/get_wishlist_remote_data_source_impl.dart'
    as _i333;
import '../../presentation/profile/Data/Repository/profile_repository_impl.dart'
    as _i216;
import '../../presentation/profile/Data/Repository/wishlist_repository_impl.dart'
    as _i268;
import '../../presentation/profile/Domain/repository/profile_repository.dart'
    as _i339;
import '../../presentation/profile/Domain/repository/wishlist_repository.dart'
    as _i187;
import '../../presentation/profile/Domain/use_cases/profile_get_use_case.dart'
    as _i952;
import '../../presentation/profile/Domain/use_cases/wishlist_use_case.dart'
    as _i193;
import '../../presentation/profile/ui/cubit/profile_page_view_model.dart'
    as _i812;
import '../api%20manager/api_manager.dart' as _i949;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i949.ApiManager>(() => _i949.ApiManager());
    gh.factory<_i345.GetWishlistRemoteDataSource>(() =>
        _i333.GetWishlistRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i293.AuthRemoteDataSource>(() =>
        _i1054.AuthRemoteDataSourceImpl(apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i182.GetProfileRemoteDataSource>(() =>
        _i104.GetProfileRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i471.AuthRepository>(() => _i659.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i293.AuthRemoteDataSource>()));
    gh.factory<_i339.ProfileRepository>(() => _i216.ProfileRepositoryImpl(
        getProfileRemoteDataSource: gh<_i182.GetProfileRemoteDataSource>()));
    gh.factory<_i952.ProfileGetUseCase>(() => _i952.ProfileGetUseCase(
        profileRepository: gh<_i339.ProfileRepository>()));
    gh.factory<_i187.WishlistRepository>(() => _i268.WishlistRepositoryImpl(
        getWishlistRemoteDataSource: gh<_i345.GetWishlistRemoteDataSource>()));
    gh.factory<_i193.WishlistUseCase>(() => _i193.WishlistUseCase(
        wishlistRepository: gh<_i187.WishlistRepository>()));
    gh.factory<_i105.AuthUseCase>(
        () => _i105.AuthUseCase(authRepository: gh<_i471.AuthRepository>()));
    gh.factory<_i812.ProfilePageViewModel>(() => _i812.ProfilePageViewModel(
          profileGetUseCase: gh<_i952.ProfileGetUseCase>(),
          wishlistUseCase: gh<_i193.WishlistUseCase>(),
        ));
    gh.factory<_i212.AuthViewModel>(
        () => _i212.AuthViewModel(authUseCase: gh<_i105.AuthUseCase>()));
    return this;
  }
}
