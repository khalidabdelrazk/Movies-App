import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/presentation/browse/ui/browse_page.dart';
import 'package:movies/presentation/home/ui/home_page.dart';
import 'package:movies/presentation/profile%20update/ui/profile_page.dart';
import 'package:movies/presentation/search/ui/search_page.dart';

List rootBody = [
  {
    "icon" : AppAssets.home,
    "page" : HomePage(),
  },
  {
    "icon" : AppAssets.search,
    "page" : SearchPage(),
  },
  {
    "icon" : AppAssets.browse,
    "page" : BrowsePage(),
  },
  {
    "icon" : AppAssets.profile,
    "page" : ProfilePage(),
  },
];