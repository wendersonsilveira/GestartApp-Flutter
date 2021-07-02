// import 'package:Gestart/app/constants/route_name.dart';
// import 'package:Gestart/data/data_sources/auth/auth_local_data_source.dart';
// import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  @override
  Future onError(DioError error) async {
    if (error.response?.statusCode == 401 && error.request.path != 'login')
      goToLogin();
    return super.onError(error);
  }

  goToLogin() {
    getIt.get<SharedPreferencesManager>().removeAll();
    Modular.navigator.pushReplacementNamed(RouteName.login,
        arguments: 'Sua sessão expirou, logue–se novamente.');
  }

  @override
  Future onRequest(RequestOptions options) async {
    var token = await getIt<AuthLocalDataSource>().getToken();
    if (token != null) options.headers['accesstoken'] = token;
    return super.onRequest(options);
  }
}
