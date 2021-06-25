import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.testsUseCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text('GestartApp'),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
              icon: Image.asset(
                IconsUtils.logo,
              ),
              onPressed: () async {}),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              Icons.info,
              color: Colors.grey,
            ),
            label: 'wewewe',
            backgroundColor: AppColorScheme.corMenuBotton,
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
      body: Column(
        children: <Widget>[
          ContainedButtonWidget(
              text: "CONTINUAR",
              onPressed: () {
                controller.voltar();
              })
        ],
      ),
    );
  }
}
