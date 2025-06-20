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
import '../../presentation/profile%20update/data/data_sources/remote/delete_profile_remote_data_source.dart'
    as _i826;
import '../../presentation/profile%20update/data/data_sources/remote/impl/delete_profile_remote_data_source_impl.dart'
    as _i406;
import '../../presentation/profile%20update/data/data_sources/remote/impl/reset_password_remote_data_source_impl.dart'
    as _i45;
import '../../presentation/profile%20update/data/data_sources/remote/impl/update_profile_remote_data_source_impl.dart'
    as _i863;
import '../../presentation/profile%20update/data/data_sources/remote/reset_password_remote_data_source.dart'
    as _i781;
import '../../presentation/profile%20update/data/data_sources/remote/update_profile_remote_data_source.dart'
    as _i696;
import '../../presentation/profile%20update/data/repository/delete_profile_repository_impl.dart'
    as _i710;
import '../../presentation/profile%20update/data/repository/reset_password_repository_impl.dart'
    as _i892;
import '../../presentation/profile%20update/data/repository/update_profile_repository_impl.dart'
    as _i46;
import '../../presentation/profile%20update/domain/repository/delete_profile_repository.dart'
    as _i839;
import '../../presentation/profile%20update/domain/repository/reset_password_repository.dart'
    as _i354;
import '../../presentation/profile%20update/domain/repository/update_profile_repository.dart'
    as _i554;
import '../../presentation/profile%20update/domain/use_cases/delete_profile_use_case.dart'
    as _i120;
import '../../presentation/profile%20update/domain/use_cases/reset_password_use_case.dart'
    as _i233;
import '../../presentation/profile%20update/domain/use_cases/update_profile_use_case.dart'
    as _i533;
import '../../presentation/profile%20update/ui/cubit/profile_update_view_model.dart'
    as _i252;
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
    gh.factory<_i781.ResetPasswordRemoteDataSource>(() =>
        _i45.ResetPasswordRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i345.GetWishlistRemoteDataSource>(() =>
        _i333.GetWishlistRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i293.AuthRemoteDataSource>(() =>
        _i1054.AuthRemoteDataSourceImpl(apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i354.ResetPasswordRepository>(() =>
        _i892.ResetPasswordRepositoryImpl(
            resetPasswordRemoteDataSource:
                gh<_i781.ResetPasswordRemoteDataSource>()));
    gh.factory<_i182.GetProfileRemoteDataSource>(() =>
        _i104.GetProfileRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i696.UpdateProfileRemoteDataSource>(() =>
        _i863.UpdateProfileRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i826.DeleteProfileRemoteDataSource>(() =>
        _i406.DeleteProfileRemoteDataSourceImpl(
            apiManager: gh<_i949.ApiManager>()));
    gh.factory<_i233.ResetPasswordUseCase>(() => _i233.ResetPasswordUseCase(
        resetPasswordRepository: gh<_i354.ResetPasswordRepository>()));
    gh.factory<_i471.AuthRepository>(() => _i659.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i293.AuthRemoteDataSource>()));
    gh.factory<_i554.UpdateProfileRepository>(() =>
        _i46.UpdateProfileRepositoryImpl(
            updateProfileRemoteDataSource:
                gh<_i696.UpdateProfileRemoteDataSource>()));
    gh.factory<_i533.UpdateProfileUseCase>(() => _i533.UpdateProfileUseCase(
        updateProfileRepository: gh<_i554.UpdateProfileRepository>()));
    gh.factory<_i339.ProfileRepository>(() => _i216.ProfileRepositoryImpl(
        getProfileRemoteDataSource: gh<_i182.GetProfileRemoteDataSource>()));
    gh.factory<_i952.ProfileGetUseCase>(() => _i952.ProfileGetUseCase(
        profileRepository: gh<_i339.ProfileRepository>()));
    gh.factory<_i187.WishlistRepository>(() => _i268.WishlistRepositoryImpl(
        getWishlistRemoteDataSource: gh<_i345.GetWishlistRemoteDataSource>()));
    gh.factory<_i193.WishlistUseCase>(() => _i193.WishlistUseCase(
        wishlistRepository: gh<_i187.WishlistRepository>()));
    gh.factory<_i839.DeleteProfileRepository>(() =>
        _i710.DeleteProfileRepositoryImpl(
            deleteProfileRemoteDataSource:
                gh<_i826.DeleteProfileRemoteDataSource>()));
    gh.factory<_i105.AuthUseCase>(
        () => _i105.AuthUseCase(authRepository: gh<_i471.AuthRepository>()));
    gh.factory<_i120.DeleteProfileUseCase>(() => _i120.DeleteProfileUseCase(
        deleteProfileRepository: gh<_i839.DeleteProfileRepository>()));
    gh.factory<_i252.UpdateProfilePageViewModel>(
        () => _i252.UpdateProfilePageViewModel(
              updateProfileUseCase: gh<_i533.UpdateProfileUseCase>(),
              deleteProfileUseCase: gh<_i120.DeleteProfileUseCase>(),
              resetPasswordUseCase: gh<_i233.ResetPasswordUseCase>(),
            ));
    gh.factory<_i812.ProfilePageViewModel>(() => _i812.ProfilePageViewModel(
          profileGetUseCase: gh<_i952.ProfileGetUseCase>(),
          wishlistUseCase: gh<_i193.WishlistUseCase>(),
        ));
    gh.factory<_i212.AuthViewModel>(
        () => _i212.AuthViewModel(authUseCase: gh<_i105.AuthUseCase>()));
    return this;
  }
}
