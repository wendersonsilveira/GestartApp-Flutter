import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'veiculos_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';

class VeiculosPage extends StatefulWidget {
  final String title;
  const VeiculosPage({Key key, this.title = "Veiculos"}) : super(key: key);

  @override
  _VeiculosPageState createState() => _VeiculosPageState();
}

class _VeiculosPageState
    extends ModularState<VeiculosPage, VeiculosController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.getVeiculos();
    super.initState();
  }

  _editarVeiculo(int id) {
    Modular.navigator
        .pushNamed(RouteName.cadastroVeiculo, arguments: id)
        .then((value) => controller.getVeiculos());
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: Duration(seconds: 1),
    ));
  }

  deleteVeiculo(int id) async {
    final ResourceData r = await controller.deleteVeiculo(id);
    if (r.status == Status.success) {
      Modular.navigator.pop(true);
      showInSnackBar("Veiculo excluído com sucesso");
    } else {
      showInSnackBar(r.message);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        CustomAlertDialog.error(context, r.error.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarCustom(
        context,
        actions: [
          TextButton(
            onPressed: () => _editarVeiculo(null),
            child: Text('ADICIONAR', style: AppTextTheme.textActionButton),
          )
        ],
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(builder: (_) {
          switch (controller.veiculos.status) {
            case Status.loading:
              return CircularProgressCustom();
              break;
            case Status.success:
              return controller.veiculos.data.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FlutterIcons.car_alt_faw5s,
                            size: 70,
                            color: AppColorScheme.primaryColor,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text('Não há veículos cadastrados ainda'),
                        ],
                      ),
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.veiculos.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Dismissible(
                                    key: Key(controller.veiculos.data[index].id
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
                                        '${controller.veiculos.data[index].modelo}  ${controller.veiculos.data[index].ano}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF8A8A8A)),
                                      ),
                                      subtitle: Text(
                                        'Placa: ${controller.veiculos.data[index].placa}/${controller.veiculos.data[index].cor}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Container(
                                        padding: EdgeInsets.only(top: 9),
                                        child: Icon(
                                          FlutterIcons.car_alt_faw5s,
                                          size: 50.h,
                                          color: AppColorScheme.primaryColor,
                                        ),
                                      ),
                                      onTap: () => _editarVeiculo(
                                          controller.veiculos.data[index].id),
                                    ),
                                    onDismissed: (_) {
                                      setState(() {
                                        controller.removeVeiculo(index);
                                      });
                                    },
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                              "Atenção",
                                              style: TextStyle(
                                                color: AppColorScheme
                                                    .feedbackWarningDefault2,
                                              ),
                                            ),
                                            content: const Text(
                                                "Deseja realmente excluir este veiculo?"),
                                            actions: [
                                              FlatButton(
                                                onPressed: () => deleteVeiculo(
                                                    controller.veiculos
                                                        .data[index].id),
                                                child: const Text(
                                                  "Sim",
                                                  style: TextStyle(
                                                    color: AppColorScheme
                                                        .feedbackDangerBase,
                                                  ),
                                                ),
                                              ),
                                              FlatButton(
                                                onPressed: () => Modular
                                                    .navigator
                                                    .pop(false),
                                                child: const Text("Não"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
            default:
              return PageError(
                messageError: "Erro ao carregar as informações",
                onPressed: controller.getVeiculos,
              );
          }
        }),
      ),
    );
  }
}
