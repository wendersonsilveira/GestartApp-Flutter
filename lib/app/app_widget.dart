import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Gestart/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
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
              supportedLocales: <Locale>[
                Locale.fromSubtags(languageCode: 'en'),
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
