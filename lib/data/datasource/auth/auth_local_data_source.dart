import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthLocalDataSource {
  SharedPreferencesManager _sharedPreferences;
  AuthLocalDataSource(this._sharedPreferences);

  Future<String> getToken() async {
    return _sharedPreferences.getString(SharedPreferencesManager.token);
  }

  void saveToken(String token) {
    _sharedPreferences.putString(SharedPreferencesManager.token, token);
  }

  Future cleanDataLocal() async {
    return _sharedPreferences.removeAll();
  }
}
