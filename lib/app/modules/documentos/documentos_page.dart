import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field3.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import 'documentos_controller.dart';

class DocumentosPage extends StatefulWidget {
  final String title;
  const DocumentosPage({Key key, this.title = "Documentos"}) : super(key: key);

  @override
  _DocumentosPageState createState() => _DocumentosPageState();
}

class _DocumentosPageState
    extends ModularState<DocumentosPage, DocumentosController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Observer(
            builder: (_) => controller.documentos.status == Status.loading
                ? CircularProgressCustom()
                : Column(
                    children: [
                      DropdownButtonFieldWidget(
                        label: 'Condominios',
                        hint: 'Selecione',
                        value: controller.condominios.data[0].codcon,
                        list: controller.condominios.data != null
                            ? controller.condominios.data
                            : [],
                        onChanged: (value) {
                          controller.changeDropdown(value);
                        },
                      ),
                      Expanded(
                        child: controller.documentos.data != null
                            ? ListView.builder(
                                itemCount: controller.listaView.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _launchURL(controller.documentos
                                          .data[index].linkDocumento);
                                    },
                                    child: Card(
                                        margin: EdgeInsets.all(10),
                                        child: ListTile(
                                            leading: Icon(
                                              FlutterIcons.file1_ant,
                                              color:
                                                  AppColorScheme.primaryColor,
                                            ),
                                            title: Text(
                                              '${controller.documentos.data[index].pasta} ${controller.documentos.data[index].apelido}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            trailing: Icon(
                                                FlutterIcons.download_faw))),
                                  );
                                },
                              )
                            : CircularProgressCustom(),
                      )
                    ],
                  )));
  }
}
