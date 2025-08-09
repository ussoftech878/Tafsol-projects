import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
 remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
