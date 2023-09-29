import 'package:shared_preferences/shared_preferences.dart';

class Helper {
// Write DATA
  static Future<bool> savePreData(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

// Read Data
  static Future getPreData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
   static Future getkeysData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getKeys();
  }
}
