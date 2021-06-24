import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static String token = "token";
  static String config = "config";
  static String user = "user";
  static String card = "card";

  Completer<SharedPreferences> instance = Completer<SharedPreferences>();

  SharedPreferencesManager() {
    _initLocalStorage();
  }

  _initLocalStorage() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    if (!instance.isCompleted) instance.complete(share);
  }

  Future<bool> putBool(String key, bool value) async {
    try {
      SharedPreferences share = await instance.future;
      share.setBool(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> putString(String key, String value) async {
    try {
      SharedPreferences share = await instance.future;
      share.setString(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> putMap(String key, Map<String, dynamic> json) async {
    try {
      SharedPreferences share = await instance.future;
      share.setString(key, jsonEncode(json));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getBool(String key) async {
    try {
      SharedPreferences share = await instance.future;
      bool value = share.getBool(key);
      return value;
    } catch (e) {
      return false;
    }
  }

  Future<String> getString(String key) async {
    try {
      SharedPreferences share = await instance.future;
      String value = share.getString(key);
      return value;
    } catch (e) {
      return '';
    }
  }

  Future get<S>(String key, {S Function(Map) construct}) async {
    try {
      SharedPreferences share = await instance.future;
      String value = share.getString(key);
      if (construct == null) {
        return value;
      } else {
        Map<String, dynamic> json = jsonDecode(value);
        return construct(json);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future remove(String key) async {
    SharedPreferences share = await instance.future;
    return share.remove(key);
  }

  Future removeAll() async {
    SharedPreferences share = await instance.future;
    return share.clear();
  }
}
