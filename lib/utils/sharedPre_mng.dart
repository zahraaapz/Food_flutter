import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMannager{

 SharedPreferences? sharedPreferences;
 SharedPreferencesMannager._();


static final SharedPreferencesMannager _instance=SharedPreferencesMannager._();

 factory SharedPreferencesMannager()=>_instance;
 
 
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await sharedPreferences?.setString(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await sharedPreferences?.setInt(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await sharedPreferences?.setBool(key, value);
  }

  String? getString(String key) {
    return sharedPreferences?.getString(key);
  }

  int? getInt(String key) {
    return sharedPreferences?.getInt(key);
  }

  bool? getBool(String key) {
    return sharedPreferences?.getBool(key);
  }

  Future<void> remove(String key) async {
    await sharedPreferences?.remove(key);
  }
}