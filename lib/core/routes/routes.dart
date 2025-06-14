import 'package:flutter/cupertino.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/presentation/authentication/ui/screens/login.dart';
import 'package:movies/presentation/authentication/ui/screens/register.dart';
import 'package:movies/presentation/authentication/ui/screens/reset_password.dart';
import 'package:movies/presentation/movie%20details/ui/movie_details.dart';
import 'package:movies/presentation/on%20boarding/ui/onboarding_screen.dart';
import 'package:movies/presentation/profile%20update/ui/profile_update.dart';
import '../../presentation/root/root.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> myAppRoutes = {
    RouteNames.root:          (_) => Root(),
    RouteNames.login:         (_) => Login(),
    RouteNames.register:      (_) => Register(),
    RouteNames.onboarding:    (_) => OnboardingScreen(),
    RouteNames.movieDetails:  (_) => MovieDetails(),
    RouteNames.resetPassword: (_) => ResetPassword(),
    RouteNames.profileUpdate: (_) => ProfileUpdate(),
    // RouteNames.x: (_) => X(),
  };
}
