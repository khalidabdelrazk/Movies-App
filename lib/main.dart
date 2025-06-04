import 'package:flutter/material.dart';
import 'package:movies/core/routes/route_names.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: Routes.myAppRoutes,
      initialRoute: RouteNames.root,
    );
  }
}
