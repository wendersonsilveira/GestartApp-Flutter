import 'dart:async';
import 'dart:io';

import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/dashboard/components/cards/card_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_images.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/button_services/button_services_widget.dart';
import 'components/itens_services/item_servico_widget.dart';
import 'dashboard_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
  PDFDocument document;
  bool isNotifyConfig = false;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );
  @override
  void initState() {
    _firebaseMessaging.getToken().then((value) {
      sharedPreferences.putString('devicekey', value);
    });
    _initPackageInfo();
    Platform.isIOS ? configNotificationIOS() : configNotificationAndroid();

    controller.testsUseCases();
    initNotificationLocal();
    controller.init();

    controller.checkStorageVersionDiff().then((value) async {
      if (value['forceUpdate'] && value['isVisible']) {
        await showInforOnLoad(context, value['deviceVersion'],
            value['storeVersion'], value['forceUpdate']);
      } else if (value['isVisible']) {
        String message = 'Clique aqui para atualizar';
        String title = 'Nova versão Gestart app disponível';
        showTopSnackBar(context, message, title);
      }
    });

    super.initState();
  }

  Future refreshList() {
    return controller.getInforCondominios();
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

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
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

  void showTopSnackBar(BuildContext context, String message, String titulo,
      {String page = '', String id = ''}) {
    int iD = id != '' ? int.parse(id) : null;
    String toPage = page.trim();
    Flushbar(
      icon: Image.asset(
        AppImages.icon,
        height: 30,
        width: 30,
      ),
      shouldIconPulse: true,
      message: message,
      backgroundColor: Color.fromRGBO(60, 60, 60, 20),
      title: titulo,
      onTap: (_) {
        if (toPage.isNotEmpty && iD != null)
          Modular.navigator.pushNamed('$toPage', arguments: int.parse(id));
        else if (toPage.isNotEmpty && iD == null)
          Modular.navigator.pushNamed('$toPage');
        else
          print('Apenas notificação');
      },
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }

  configNotificationIOS() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        var texto = message['body'];
        var titulo = message['title'];
        showTopSnackBar(context, texto, titulo,
            page: '/${message['servico']}', id: '${message['item_id']}');
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

  Widget _infoTile(String title, String subtitle, String v) {
    // return ListTile(
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(title),
    //         Text(v,
    //             style:
    //                 TextStyle(color: AppColorScheme.tagGreen2, fontSize: 15)),
    //       ],
    //     ),
    //     onTap: () {
    //       _launchURL(Platform.isIOS
    //           ? 'https://apps.apple.com/br/app/gestartapp/id1444521402'
    //           : 'https://play.google.com/store/apps/details?id=com.gestart.gestartapp');
    //     },
    //     subtitle: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Text(subtitle ?? 'Not set'),
    //         Icon(
    //           FlutterIcons.refresh_mdi,
    //           color: AppColorScheme.tagGreen2,
    //         )
    //       ],
    //     ));
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  showInfor(BuildContext context) {
    CustomAlertDialog.question(context,
        title: "GestartApp:  ${controller.storeVersion}",
        message: "Atualize seu app pela loja ",
        colorNegative: AppColorScheme.tagRed2,
        colorPositive: AppColorScheme.tagBlue2,
        textButtonNegative: "Sair",
        textButtonPositive: "Atualizar",
        onActionNegativeButton: () => {print('fechar tela')},
        onActionPositiveButton: () => _launchURL(Platform.isIOS
            ? 'https://apps.apple.com/br/app/gestartapp/id1444521402'
            : 'https://play.google.com/store/apps/details?id=com.gestart.gestartapp'));
  }

  showInforOnLoad(
      BuildContext context, deviceVersion, storeVersion, forceUpdate) {
    CustomAlertDialog.uploadInfo(context,
        textButton: 'Atualizar',
        barrierDismissible: !forceUpdate,
        title: "GestartApp:  ${storeVersion}",
        message: "Seu app está na versão ${deviceVersion}, Atualize pela loja ",
        onActionButton: () => _launchURL(Platform.isIOS
            ? 'https://apps.apple.com/br/app/gestartapp/id1444521402'
            : 'https://play.google.com/store/apps/details?id=com.gestart.gestartapp'));
  }

  showUpToDate(BuildContext context) {
    CustomAlertDialog.uploadInfo(context,
        textButton: 'Ok',
        title: "GestartApp:  ${controller.storeVersion}",
        message: "Seu app está atualizado!",
        onActionButton: () => (print('teste')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        center: false,
        title: Text('GestartApp'),
        actions: [
          IconButton(
            icon: Icon(
              FlutterIcons.exclamation_evi,
              color: AppColorScheme.white,
              size: 30,
            ),
            onPressed: () {
              if (controller.isVisible) {
                showInfor(context);
              } else {
                showUpToDate(context);
              }
            },
          )
        ],
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
            : RefreshIndicator(
                onRefresh: refreshList,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
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
                                      icon: FlutterIcons.barcode_ant,
                                      descricao: 'Boleto Digital',
                                      route: RouteName.boleto),
                                  ButtonSercicesWidget(
                                    condominioAtivo:
                                        controller.existeCondominiosAtivos,
                                    icon: FlutterIcons.md_paper_ion,
                                    descricao: 'Prestação de Contas',
                                    route: RouteName.balancetes,
                                  ),
                                  ButtonSercicesWidget(
                                    condominioAtivo:
                                        controller.existeCondominiosAtivos,
                                    icon: Icons.event_available,
                                    descricao: 'Reservas',
                                    route: RouteName.reservas,
                                    statusReserva:
                                        controller.servicoReservaDisponivel,
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
                                      icone: FlutterIcons.gavel_faw5s,
                                      routeName: RouteName.assembleia,
                                      condominios: controller.condominios.data,
                                    ),
                                  ),
                                  Card(
                                    child: ItemServicoWidget(
                                      condominioAtivo:
                                          controller.existeCondominiosAtivos,
                                      descricao: 'Documentos',
                                      icone: FlutterIcons.file1_ant,
                                      routeName: RouteName.documentos,
                                    ),
                                  ),
                                  Card(
                                    child: ItemServicoWidget(
                                      condominioAtivo:
                                          controller.existeCondominiosAtivos,
                                      descricao: 'Seu Condomínio',
                                      icone: FlutterIcons.building_faw,
                                      routeName: RouteName.infor_condominio,
                                    ),
                                  ),
                                  Card(
                                    child: ItemServicoWidget(
                                      condominioAtivo: true,
                                      descricao: 'Cadastro',
                                      icone: FlutterIcons.id_card_mco,
                                      routeName: RouteName.cadastros,
                                    ),
                                  ),
                                  controller.isSindico
                                      ? Card(
                                          child: ItemServicoWidget(
                                            condominioAtivo: true,
                                            descricao: 'Painel do Síndico',
                                            icone: FlutterIcons.md_analytics_ion,
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
      ),
    );
  }
}
