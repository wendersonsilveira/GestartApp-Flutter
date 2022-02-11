import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_list_item_widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'documentos_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentosPage extends StatefulWidget {
  final String title;
  const DocumentosPage({Key key, this.title = "Documentos"}) : super(key: key);

  @override
  _DocumentosPageState createState() => _DocumentosPageState();
}

class _DocumentosPageState
    extends ModularState<DocumentosPage, DocumentosController> {
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
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          switch (controller.documentos.status) {
            case Status.loading:
              return CircularProgressCustom();
              break;
            case Status.success:
              return Column(
                children: [
                  DropdownButtonFieldWidget(
                    label: 'Condomínios',
                    hint: 'Selecione',
                    list: controller.condominios.data,
                    value: controller.codCon,
                    onChanged: (value) {
                      controller.changeDropdown(value);
                    },
                  ),
                  Expanded(
                    child: controller.documentos.data != null
                        ? controller.listaView.length == 0
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.subtitles_off,
                                      size: 70,
                                      color: AppColorScheme.primaryColor,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Text(
                                        'Não existe documentos para este condomínio'),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.listaView.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return DownloadListItemWidget(
                                    leading: Icon(
                                      LineIcons.file,
                                      color: AppColorScheme.primaryColor,
                                    ),
                                    title: Text(
                                      '${controller.listaView[index].pasta}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                        ' ${controller.listaView[index].descricao}'),
                                    trailing: Icon(LineIcons.fileDownload),
                                    fileURL: controller
                                        .listaView[index].linkDocumento,
                                    fileName:
                                        '${controller.listaView[index].descricao}_${controller.listaView[index].apelido.substring(0, 4)}_${controller.listaView[index].id}.${controller.listaView[index].tipo}',
                                  );
                                },
                              )
                        : CircularProgressCustom(),
                  )
                ],
              );
            default:
              return PageError(
                messageError: "Erro ao carregar as informações",
                onPressed: controller.init,
              );
          }
        }));
  }
}
