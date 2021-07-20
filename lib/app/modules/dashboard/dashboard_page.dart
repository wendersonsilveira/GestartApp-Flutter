import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/dashboard/components/cards/card_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/icons/icons_utils.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:Gestart/data/local/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
final sharedPreferences = getIt.get<SharedPreferencesManager>();

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    _firebaseMessaging
        .getToken()
        .then((value) => sharedPreferences.putString('devicekey', value));
    controller.testsUseCases();
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () async {}),
        ),
      ),

      body: Observer(
        builder: (_) => controller.statusLoading
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
                                if (controller.isSindico)
                                  ItemServicoWidget(
                                    condominioAtivo: true,
                                    descricao: 'Painel do Síndico',
                                    icone: FlutterIcons.md_analytics_ion,
                                    routeName: RouteName.painel_sindico,
                                  ),
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
      // _isLoading ? PDFViewer(document: document) : CircularProgressCustom(),
    );
  }
}
