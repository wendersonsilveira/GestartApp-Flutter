import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_list_item_widget.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_button_field.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:open_file/open_file.dart';
import 'documentos_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

class DocumentosPage extends StatefulWidget {
  final String title;
  const DocumentosPage({Key key, this.title = "Documentos"}) : super(key: key);

  @override
  _DocumentosPageState createState() => _DocumentosPageState();
}

class _DocumentosPageState extends ModularState<DocumentosPage, DocumentosController> {
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
        body: Observer(
            builder: (_) => controller.documentos.status == Status.loading
                ? CircularProgressCustom()
                : Column(
                    children: [
                      DropdownButtonFieldWidget(
                        label: 'Condominios',
                        hint: 'Selecione',
                        value: controller.condominios.data[0].codcon,
                        list: controller.condominios.data != null ? controller.condominios.data : [],
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
                                        Text('Não existe documentos para este condomínio'),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: controller.listaView.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return DownloadListItemWidget(
                                        leading: Icon(
                                          FlutterIcons.file1_ant,
                                          color: AppColorScheme.primaryColor,
                                        ),
                                        title: Text(
                                          '${controller.listaView[index].pasta}',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: Text(' ${controller.listaView[index].descricao}'),
                                        trailing: Icon(FlutterIcons.download_faw),
                                        fileURL: controller.documentos.data[index].linkDocumento,
                                        fileName: '${controller.documentos.data[index].descricao}.${controller.documentos.data[index].tipo}',
                                      );
                                    },
                                  )
                            : CircularProgressCustom(),
                      )
                    ],
                  )));
  }
}
