import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_generic_widget.dart';
import 'package:Gestart/app/widgets/download/download_item_widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'informativo_controller.dart';

class InformativoPage extends StatefulWidget {
  final String title;
  final int id;
  const InformativoPage({Key key, this.title = "Comunicado", this.id})
      : super(key: key);

  @override
  _InformativoPageState createState() => _InformativoPageState();
}

class _InformativoPageState
    extends ModularState<InformativoPage, InformativoController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.init(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => controller.aviso.status == Status.loading
              ? CircularProgressCustom()
              : Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(controller.aviso.data.apelido),
                        subtitle: Text(
                            UIHelper.formatDate(controller.aviso.data.datEmi)),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(controller.aviso.data.att,
                                textAlign: TextAlign.center,
                                style: AppTextTheme.negritoInformativo),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.aviso.data.descricao.trim(),
                              textAlign: TextAlign.start,
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // DownloadGenericWidget(
                            //   fileName: controller.aviso.data.apelido,
                            //   fileURL: controller.aviso.data.linkMalaDireta,
                            // ),
                            // Text(
                            //   controller.aviso.data.linkMalaDireta,
                            //   textAlign: TextAlign.start,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
