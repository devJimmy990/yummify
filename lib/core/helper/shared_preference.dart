import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference(this._shared);
  final SharedPreferences _shared;

  Future<bool> setString({required String key, required String value}) async =>
      _shared.setString(key, value);

  String? getString({required String key}) => _shared.getString(key);

  Future<bool> setBool({required String key, required bool value}) async =>
      _shared.setBool(key, value);

  bool getBool({required String key}) => _shared.getBool(key) ?? false;

  Future<bool> remove({required String key}) async => _shared.remove(key);

  Future<bool> clear() async => _shared.clear();

  bool checkData({required String key}) => _shared.containsKey(key);
}
