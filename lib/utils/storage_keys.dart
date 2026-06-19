import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_bill/model/user.dart';

class StorageKeys {
  static const String USER = "user";
  static const String ACCESS_TOKEN = "accessToken";
}

class StorageHelper {
  static final GetStorage _box = GetStorage();

  /// GET TOKEN
  static String? getToken() {
    try {
      return _box.read(StorageKeys.ACCESS_TOKEN);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  /// GET USER
  static Users? getUser() {
    try {
      final data = _box.read(StorageKeys.USER);

      if (data == null) return null;

      return Users.fromJson(json.decode(data));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  /// SAVE USER
  static Future<void> saveUser(Users user) async {
    try {
      await _box.write(StorageKeys.USER, jsonEncode(user.toJson()));
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  /// 🔥 CLEAR ALL DATA (THIS FIXES YOUR ERROR)
  static Future<void> clearAll() async {
    try {
      await _box.erase();
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
