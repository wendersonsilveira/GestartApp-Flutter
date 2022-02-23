import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pets_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';

class PetsPage extends StatefulWidget {
  final String title;
  const PetsPage({Key key, this.title = "Pets"}) : super(key: key);

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends ModularState<PetsPage, PetsController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.getPets();
    super.initState();
  }

  _editarPet(int id) {
    Modular.to
        .pushNamed(RouteName.cadastro_pet, arguments: id)
        .then((value) => controller.getPets());
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(value),
      duration: Duration(seconds: 1),
    ));
  }

  deletePet(int id) async {
    final ResourceData r = await controller.deletePet(id);
    if (r.status == Status.success) {
      Modular.to.pop(true);
      showInSnackBar("Pet excluído com sucesso");
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
            onPressed: () => _editarPet(null),
            child: Text('ADICIONAR', style: AppTextTheme.textActionButton),
          )
        ],
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(builder: (_) {
          switch (controller.pets.status) {
            case Status.loading:
              return CircularProgressCustom();
              break;
            case Status.success:
              return controller.pets.data.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pets,
                            size: 70,
                            color: AppColorScheme.primaryColor,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text('Não há pets cadastrados ainda'),
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
                              itemCount: controller.pets.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Dismissible(
                                    key: Key(controller.pets.data[index].id
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
                                        '${controller.pets.data[index].tipo}  ${controller.pets.data[index].raca}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF8A8A8A)),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Nome: ${controller.pets.data[index].nome}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '/ ${controller.pets.data[index].porte}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      leading: Container(
                                        padding: EdgeInsets.only(top: 9),
                                        child: Icon(
                                          Icons.pets,
                                          size: 50.h,
                                          color: AppColorScheme.primaryColor,
                                        ),
                                      ),
                                      onTap: () => _editarPet(
                                          controller.pets.data[index].id),
                                    ),
                                    onDismissed: (_) {
                                      setState(() {
                                        controller.removePet(index);
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
                                                "Deseja realmente excluir este pet?"),
                                            actions: [
                                              OutlinedButton(
                                                onPressed: () => deletePet(
                                                    controller
                                                        .pets.data[index].id),
                                                child: const Text(
                                                  "Sim",
                                                  style: TextStyle(
                                                    color: AppColorScheme
                                                        .feedbackDangerBase,
                                                  ),
                                                ),
                                              ),
                                              OutlinedButton(
                                                onPressed: () =>
                                                    Modular.to.pop(false),
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
                onPressed: controller.getPets,
              );
          }
        }),
      ),
    );
  }
}
