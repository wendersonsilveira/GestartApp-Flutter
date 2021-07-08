import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/dashboard/components/cards/card_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'components/button_services/button_services_widget.dart';
import 'components/itens_services/item_servico_widget.dart';
import 'dashboard_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    controller.testsUseCases();
    controller.init();
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
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => controller.condominios?.status == Status.loading &&
                  controller.condominiosAtivos?.status == Status.loading
              ? Center(child: CircularProgressCustom())
              : Container(
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
                                  icon: FlutterIcons.check_ant,
                                  descricao: 'Reservas',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 46.h,
                          ),
                          Container(
                            child: Column(
                              children: [
                                ItemServicoWidget(
                                  condominioAtivo:
                                      controller.existeCondominiosAtivos,
                                  descricao: 'Assembleia',
                                  icone: FlutterIcons.gavel_faw5s,
                                  routeName: RouteName.assembleia,
                                  condominios: controller.condominios.data,
                                ),
                                ItemServicoWidget(
                                  condominioAtivo:
                                      controller.existeCondominiosAtivos,
                                  descricao: 'Documentos',
                                  icone: FlutterIcons.file1_ant,
                                  routeName: RouteName.documentos,
                                ),
                                ItemServicoWidget(
                                  condominioAtivo:
                                      controller.existeCondominiosAtivos,
                                  descricao: 'Seu Condomínio',
                                  icone: FlutterIcons.building_faw,
                                  routeName: RouteName.infor_condominio,
                                ),
                                ItemServicoWidget(
                                  condominioAtivo: true,
                                  descricao: 'Cadastro',
                                  icone: FlutterIcons.id_card_mco,
                                  routeName: RouteName.cadastros,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ContainedButtonWidget(
                          text: "LOGOUT",
                          onPressed: () {
                            controller.voltar();
                          })
                    ],
                  ),
                ),
        ),
      ),
      // _isLoading ? PDFViewer(document: document) : CircularProgressCustom(),
    );
  }
}
