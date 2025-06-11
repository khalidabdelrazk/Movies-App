import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefObject {
  SharedPreferences? _prefs;

  static const String tokenKey = 'tokenKey';

  Future<SharedPreferences> getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
