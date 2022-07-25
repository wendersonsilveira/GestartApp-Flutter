import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'listar_espacos_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListarEspacosPage extends StatefulWidget {
  final String title;
  const ListarEspacosPage({Key key, this.title = "Listar Espaços"})
      : super(key: key);

  @override
  _ListarEspacosPageState createState() => _ListarEspacosPageState();
}

class _ListarEspacosPageState
    extends ModularState<ListarEspacosPage, ListarEspacosController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  excluirEspaco(idEspaco) async {
    final r = await controller.excluirEspaco(idEspaco);
    if (r.status == Status.success) {
      controller.init();

      UIHelper.showInSnackBar(r.message, _scaffoldKey);
    } else {
      UIHelper.showInSnackBar(r.message, _scaffoldKey);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CustomAlertDialog.error(context, r.error.message);
      });
    }
  }

  Future<bool> checarSeExisteReservas(idEspaco) async {
    final result = await controller.checarSeExisteReservas(idEspaco);
    bool retorno;
    if (result == 0) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CustomAlertDialog.question(context,
            message: "Deseja realmente excluir este espaço?",
            colorPositive: AppColorScheme.feedbackDangerDark,
            colorNegative: Colors.blue, onActionPositiveButton: () {
          excluirEspaco(idEspaco);
          retorno = true;
        }, onActionNegativeButton: () {
          retorno = false;
        },
            textButtonNegative: "Não",
            textButtonPositive: "Sim",
            title: "Atenção");
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CustomAlertDialog.info(
          context,
          "Atenção",
          "Existem reservas vinculadas a este espaço. Não é possível excluir.",
          () {},
        );
      });
    }
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarCustom(
          context,
          center: false,
          actions: [
            TextButton(
              onPressed: () => Modular.navigator
                  .pushNamed(RouteName.cadastro_espaco, arguments: null)
                  .then((value) => controller.init()),
              child: Text('ADICIONAR', style: AppTextTheme.textActionButton),
            )
          ],
          title: Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Observer(builder: (_) {
          switch (controller.espacos.status) {
            case Status.success:
              return controller.espacos.data.length > 0
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.espacos.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    child: Dismissible(
                                        key: Key(controller
                                            .espacos.data[index].id
                                            .toString()),
                                        background: Container(
                                          color: AppColorScheme.tagRed2,
                                          child: Icon(
                                            Icons.delete,
                                            color: AppColorScheme.white,
                                          ),
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            '${controller.espacos.data[index].descricao}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF8A8A8A)),
                                          ),
                                          trailing: Icon(Icons.arrow_right),
                                          leading: Container(
                                            padding: EdgeInsets.only(top: 9),
                                            child: Icon(
                                              Icons.ac_unit,
                                              size: 50.h,
                                              color: controller.espacos
                                                      .data[index].statusEspaco
                                                  ? AppColorScheme.primaryColor
                                                  : Colors.grey[400],
                                            ),
                                          ),
                                          onTap: () => Modular.navigator
                                              .pushNamed(
                                                  RouteName.cadastro_espaco,
                                                  arguments: controller
                                                      .espacos.data[index].id),
                                        ),
                                        confirmDismiss: (_) =>
                                            checarSeExisteReservas(controller
                                                .espacos.data[index].id)));
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ac_unit,
                            size: 70,
                            color: AppColorScheme.primaryColor,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text('Não há espaços cadastrados'),
                        ],
                      ),
                    );
              break;
            case Status.failed:
              return Center(
                child: PageError(
                  messageError: 'Erro ao carregar os espaços',
                  onPressed: controller.init,
                ),
              );
              break;
            default:
              return Center(child: CircularProgressCustom());
          }
        }));
  }
}
