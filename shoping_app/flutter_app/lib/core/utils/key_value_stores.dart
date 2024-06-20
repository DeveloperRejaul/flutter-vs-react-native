import 'package:shared_preferences/shared_preferences.dart';

class KayValueStores {
  static Future<SharedPreferences> _load() async {
    return SharedPreferences.getInstance();
  }

  static Future<String> read(String key) async {
    try {
      final prefs = await _load();
      return await prefs.getString(key) ?? "";
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  static Future write(String key, String value) async {
    try {
      final prefs = await _load();
      await prefs.setString(key, value);
    } catch (e) {
      print(e);
    }
  }

  static Future delete(String key) async {
    try {
      final prefs = await _load();
      await prefs.remove(key);
    } catch (e) {
      print(e);
    }
  }
}
