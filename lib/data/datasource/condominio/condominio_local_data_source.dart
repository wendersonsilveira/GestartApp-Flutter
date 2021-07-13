import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CondominioLocalDataSource {
  // SharedPreferencesManager _sharedPreferences;
  CondominioLocalDataSource();

  Future<String> getCondominio() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getString('condominio');
  }

  void saveCondominio(int codcon) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.setInt('condominio', codcon);
  }
}
