import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/generated/codegen_loader.g.dart';
import 'package:movies/presentation/root/root.dart';
import 'core/di/di.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/utils/shared_pref_services.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  await SharedPrefService.instance.init();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar')
      ], //startLocale: Locale('en'),
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routes: Routes.myAppRoutes,
          initialRoute: isFirstOpened
              ? (isLoggedIn ? RouteNames.root : RouteNames.login)
              : RouteNames.onboarding,
          //
        );
      },
      child: Root(),
    );
  }

  bool get isLoggedIn => SharedPrefService.instance.getToken() != null;
  bool get isFirstOpened => SharedPrefService.instance.isFirsTime() ?? false;
}
