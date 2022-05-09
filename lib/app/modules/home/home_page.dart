import 'package:Gestart/app/modules/dashboard/dashboard_page.dart';
import 'package:Gestart/app/modules/informativos/informativos_page.dart';
import 'package:Gestart/app/modules/notificacoes/notificacoes_page.dart';
import 'package:Gestart/app/modules/perfil/perfil_page.dart';
import 'package:Gestart/app/modules/pesquisa_voz/pesquisa_page.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    DashboardPage(),
    InformativosPage(),
    PesquisaPage(),
    NotificacoesPage(),
    PerfilPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //android
        CustomAlertDialog.question(context,
            message: "Deseja sair do GestartApp?",
            onActionPositiveButton: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            onActionNegativeButton: () => Modular.navigator.pop,
            textButtonPositive: "Sim",
            colorPositive: AppColorScheme.feedbackDangerDark,
            textButtonNegative: "Cancelar",
            title: "Sair");

        //usar essa função para ios
        //MinimizeApp.minimizeApp();
      },
      child: Scaffold(
          key: _scaffoldKey,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _indiceAtual,
            onTap: onTabTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                ),
                backgroundColor: AppColorScheme.corMenuBotton,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FlutterIcons.mic_mdi,
                  color: Colors.grey,
                ),
                backgroundColor: AppColorScheme.corMenuBotton,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FlutterIcons.bell_mco,
                  color: Colors.grey,
                ),
                backgroundColor: AppColorScheme.corMenuBotton,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FlutterIcons.person_mdi,
                  color: Colors.grey,
                ),
                backgroundColor: AppColorScheme.corMenuBotton,
                label: '',
              ),
            ],
            // currentIndex: _selectedIndex,
            selectedItemColor: AppColorScheme.primaryColor,
            // onTap: _onItemTapped,
          ),
          body: _telas[_indiceAtual]),
    );
  }
}
