import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Gestart/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  @override
  void initState() {
    _firebaseMessaging.getToken().then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    controller.isUserLogged();
    return Observer(builder: (_) {
      return controller.loading
          ? Container(child: Center(child: CircularProgressCustom()))
          : MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', 'US'),
                const Locale('pt_BR', 'BR'),
              ],
              navigatorKey: Modular.navigatorKey,
              title: 'Gestart App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: controller.initRouter,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Modular.generateRoute,
            );
    });
  }
}
