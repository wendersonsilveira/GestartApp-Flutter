import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'listar_espacos_controller.dart';

class ListarEspacosPage extends StatefulWidget {
  final String title;
  const ListarEspacosPage({Key key, this.title = "Cadastro de Espaços"})
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        center: false,
        actions: [
          TextButton(
            onPressed: () =>
                Modular.navigator.pushNamed(RouteName.cadastro_espaco),
            child: Text('ADICIONAR', style: AppTextTheme.textActionButton),
          )
        ],
        title: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Observer(
        builder: (_) => controller.reservas.status == Status.loading
            ? CircularProgressCustom()
            : controller.reservas.data.length > 0
                ? Container(
                    child: ListView.builder(
                      itemCount: controller.reservas.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.all(12),
                          child: ListTile(
                            title:
                                Text(controller.reservas.data[index].descricao),
                            leading: Icon(
                              FlutterIcons.square_faw,
                              color: AppColorScheme.primaryColor,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : PageError(
                    messageError: 'teste',
                  ),
      ),
    );
  }
}
