import '../../presentation/browse/ui/browse_page.dart';
import '../../presentation/home/ui/home_page.dart';
import '../../presentation/profile/ui/profile_page.dart';
import '../../presentation/search/ui/search_page.dart';
import '../assets/app_assets.dart';

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