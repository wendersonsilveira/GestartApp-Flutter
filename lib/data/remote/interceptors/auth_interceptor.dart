// import 'package:Gestart/app/constants/route_name.dart';
// import 'package:Gestart/data/data_sources/auth/auth_local_data_source.dart';
// import 'package:Gestart/data/local/shared_preferences.dart';
import 'dart:io';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final sharedPreferences = getIt.get<SharedPreferencesManager>();
  dynamic versions = "";
  String platform = "";
  AuthInterceptor(this._dio);
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  @override
  Future onError(DioError error) async {
    if (error.response?.statusCode == 401 && error.request.path != 'login')
      goToLogin();
    return super.onError(error);
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'systemVersion': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Future<dynamic> _initPackageInfo() async {
    Map<String, dynamic> deviceData;
    if (Platform.isAndroid) {
      deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);

    final info = await PackageInfo.fromPlatform();

    await sharedPreferences.putString('version', info.version);
    await sharedPreferences.putString('versionPlatform', deviceData['systemVersion']);

    return {
      "version": info.version,
      "versionPlatform": deviceData['systemVersion']
    };
  }

  goToLogin() {
    getIt.get<SharedPreferencesManager>().removeAll();
    Modular.navigator.pushReplacementNamed(RouteName.login,
        arguments: 'Sua sessão expirou, logue–se novamente.');
  }

  @override
  Future onRequest(RequestOptions options) async {
    versions = await _initPackageInfo();
    String platform = Platform.isIOS ? "IOS" : 'Android';
    var tokenFcm = await sharedPreferences.getString('devicekey');
    var token = await getIt<AuthLocalDataSource>().getToken();
    if (token != null) options.headers['accesstoken'] = token;
    if (tokenFcm != null) options.headers['devicekey'] = tokenFcm;
    if (versions['version'] != null)
      options.headers['version'] = versions['version'];
    if (platform != null) options.headers['platform'] = platform;
    if (versions['versionPlatform'] != null)
      options.headers['platform_version'] = versions['versionPlatform'];
    return super.onRequest(options);
  }
}
