import 'dart:io';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/dashboard/components/cards/card_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/button_services/button_services_widget.dart';
import 'components/itens_services/item_servico_widget.dart';
import 'dashboard_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
final sharedPreferences = getIt.get<SharedPreferencesManager>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller
  bool isNotifyConfig = false;
  @override
  void initState() {
    _firebaseMessaging.getToken().then((value) {
      sharedPreferences.putString('devicekey', value);
    });

    Platform.isIOS ? configNotificationIOS() : configNotificationAndroid();

    controller.testsUseCases();
    initNotificationLocal();
    controller.init();
    super.initState();
  }

  initNotificationLocal() {
    var android = new AndroidInitializationSettings('icon');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    var initSettings = new InitializationSettings(
        android: android, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: (payload) {
        var arrayString = payload.split('**');
        String page = arrayString[0].trim();
        int id = int.parse(arrayString[1]);
        Modular.navigator.pushNamed('$page', arguments: id);
      },
    );
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    showDialog(
        context: null,
        builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(title),
                content: Text(body),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Ok'),
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Text('')));
                    },
                  )
                ]));
  }

  // void showTopSnackBar(BuildContext context, String message, String titulo,
  //     {String page = '', String id = ''}) {
  //   int iD = id != '' ? int.parse(id) : null;
  //   String toPage = page.trim();
  //   Flushbar(
  //     icon: Image.asset(
  //       AppImages.icon,
  //       height: 30,
  //       width: 30,
  //     ),
  //     shouldIconPulse: true,
  //     message: message,
  //     backgroundColor: Color.fromRGBO(60, 60, 60, 20),
  //     title: titulo,
  //     onTap: (_) {
  //       if (toPage.isNotEmpty && iD != null)
  //         Modular.navigator.pushNamed('$toPage', arguments: int.parse(id));
  //       else if (toPage.isNotEmpty && iD == null)
  //         Modular.navigator.pushNamed('$toPage');
  //       else
  //         print('Apenas notificação');
  //     },
  //     duration: Duration(seconds: 2),
  //     flushbarPosition: FlushbarPosition.TOP,
  //   )..show(context);
  // }

  configNotificationIOS() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        var texto = message['body'];
        var titulo = message['title'];
        print({texto});
        print({titulo});
        //flushbar descontinuado -
        // showTopSnackBar(context, texto, titulo,
        //     page: '/${message['servico']}', id: '${message['item_id']}');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        String toPage = message['servico'] != null
            ? '/' + message['servico'].toString().trim()
            : null;
        int id =
            message['item_id'] != null ? int.parse(message['item_id']) : null;
        if (toPage != null && id != null)
          Modular.navigator.pushNamed(toPage, arguments: id);
        else if (toPage != null && id == null)
          Modular.navigator.pushNamed(toPage);
        else
          print('apenas notificacao');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);

      print('token: $token');
    });
  }

  configNotificationAndroid() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        sendNotificationLocal(
            '${message['data']['title']}', '${message['data']['body']}',
            page: '/${message['data']['servico']}',
            id: int.parse(message['data']['item_id']));
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        String page = '/${message['data']['servico']}';
        int idItem = int.parse(message['data']['item_id']);
        Modular.navigator.pushNamed(page.trim(), arguments: idItem);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print('registered: $settings');
    });
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    return Future<void>.value();
  }

  sendNotificationLocal(String titulo, message, {String page, int id}) async {
    var android = new AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription');

    var iOS = new IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, titulo, message, platform,
        payload: '$page**$id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        center: false,
        title: Text('GestartApp'),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            icon: Image.asset(
              IconsUtils.logo,
            ),
            onPressed: () => {},
          ),
        ),
      ),
      body: Observer(
        builder: (_) => controller.statusLoading || !controller.chekedSindico
            ? Center(child: CircularProgressCustom())
            : SingleChildScrollView(
                child: Container(
                  color: AppColorScheme.backgroundColor,
                  child: Column(
                    children: <Widget>[
                      Observer(
                        builder: (_) => CardInfor(
                          statusCondominio: controller.statusCondominio,
                          condominio: controller.condominios.data,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonSercicesWidget(
                                    condominioAtivo:
                                        controller.existeCondominiosAtivos,
                                    icon: LineIcons.barcode,
                                    descricao: 'Boleto Digital',
                                    route: RouteName.boleto),
                                ButtonSercicesWidget(
                                  condominioAtivo:
                                      controller.existeCondominiosAtivos,
                                  icon: LineIcons.newspaper,
                                  descricao: 'Prestação de Contas',
                                  route: RouteName.balancetes,
                                ),
                                ButtonSercicesWidget(
                                  condominioAtivo:
                                      controller.existeCondominiosAtivos,
                                  icon: Icons.event_available,
                                  descricao: 'Reservas',
                                  route: RouteName.reservas,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 46.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Card(
                                  child: ItemServicoWidget(
                                    condominioAtivo:
                                        controller.existeCondominiosAtivos,
                                    descricao: 'Assembleia',
                                    icone: LineIcons.gavel,
                                    routeName: RouteName.assembleia,
                                    condominios: controller.condominios.data,
                                  ),
                                ),
                                Card(
                                  child: ItemServicoWidget(
                                    condominioAtivo:
                                        controller.existeCondominiosAtivos,
                                    descricao: 'Documentos',
                                    icone: LineIcons.file,
                                    routeName: RouteName.documentos,
                                  ),
                                ),
                                Card(
                                  child: ItemServicoWidget(
                                    condominioAtivo:
                                        controller.existeCondominiosAtivos,
                                    descricao: 'Seu Condomínio',
                                    icone: LineIcons.building,
                                    routeName: RouteName.infor_condominio,
                                  ),
                                ),
                                Card(
                                  child: ItemServicoWidget(
                                    condominioAtivo: true,
                                    descricao: 'Cadastro',
                                    icone: LineIcons.creditCard,
                                    routeName: RouteName.cadastros,
                                  ),
                                ),
                                controller.isSindico
                                    ? Card(
                                        child: ItemServicoWidget(
                                          condominioAtivo: true,
                                          descricao: 'Painel do Síndico',
                                          icone: LineIcons.barChart,
                                          routeName: RouteName.painel_sindico,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
