import 'package:flutter/cupertino.dart';
import 'package:movies/core/routes/route_names.dart';

import '../../presentation/root/ui/root.dart';


abstract class Routes {
  static Map<String, Widget Function(BuildContext)> myAppRoutes = {
    RouteNames.root: (_) => Root(),
    // RouteNames.homeScreen: (_) => HomeScreen(),
  };
}
