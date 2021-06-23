import 'package:Gestart/di/dio_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;
bool _diInitialized = false;

@injectableInit
Future initilizerInjection() async {
  if (!_diInitialized) {
    await initGetIt(getIt);
    _diInitialized = true;
  }
}
