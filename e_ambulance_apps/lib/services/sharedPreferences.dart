import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future writeData(String key, String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.setString(key, value);
    return data;
  }

  Future readData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future readAllData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final data = Map<String, dynamic>();
    for (String key in keys) {
      data[key] = prefs.get(key);
    }
    return data;
  }

  Future deleteData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var data = await pref.remove(key);
    return data;
  }
}
