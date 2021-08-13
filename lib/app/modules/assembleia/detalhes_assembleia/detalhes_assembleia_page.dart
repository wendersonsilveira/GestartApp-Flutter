import 'package:Gestart/app/modules/assembleia/components/button_ata_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhes_assembleia_controller.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/modules/assembleia/components/title_widget.dart';
import 'package:Gestart/app/modules/assembleia/components/subtitle_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetalhesAssembleiaPage extends StatefulWidget {
  final String title;
  final int id;
  const DetalhesAssembleiaPage({Key key, this.title = "Assembleia", this.id})
      : super(key: key);

  @override
  _DetalhesAssembleiaPageState createState() => _DetalhesAssembleiaPageState();
}

class _DetalhesAssembleiaPageState
    extends ModularState<DetalhesAssembleiaPage, DetalhesAssembleiaController> {
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
        title: Text('Asembleia ${widget.id}'),
        elevation: 0,
      ),
      body: Observer(builder: (_) {
        switch (controller.loading) {
          case 0:
            return CircularProgressCustom();
            break;
          case 1:
            return SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListTile(
                    leading: Image.network(
                      controller.edital.data[0].logo,
                      height: 150.h,
                      width: 150.h,
                    ),
                    title: TitleWidget(
                      nomTip: controller.edital.data[0].nomTip,
                      apelido: controller.edital.data[0].apelido,
                    ),
                    subtitle: SubTitleWidget(
                      data: controller.edital.data[0].datreu,
                      hora: controller.edital.data[0].horreu_1,
                      local: controller.edital.data[0].loc,
                    ),
                  ),
                ),
                ButtonDocumentoWidget(
                  edital: controller.edital.data[0],
                  disponivel: controller.edital.data[0].idAta,
                  tipoDocumento: 'ATA',
                  link: controller.edital.data[0].linkAta,
                  fileName: 'ATA_${controller.fileName}',
                ),
                ButtonDocumentoWidget(
                  edital: controller.edital.data[0],
                  tipoDocumento: 'EDITAL',
                  disponivel:
                      controller.edital.data[0].linkEdital != null ? 1 : 0,
                  link: controller.edital.data[0].linkEdital,
                  fileName: 'EDITAL_${controller.fileName}',
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pautas',
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            height:
                                (130.0 * controller.edital.data.length) > 520
                                    ? 520.h
                                    : (110.0 * controller.edital.data.length).h,
                            child: ListView.builder(
                              itemCount: controller.edital.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                      '${index + 1} - ${controller.edital.data[index].assunto}'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                        controller.edital.data[0].nomsolLinkPhoto),
                    title: Text('Solicitante'),
                    subtitle: Text(controller.edital.data[0].nomsol),
                  ),
                ),
                controller.edital.data[0].idAta != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.network(
                                  controller.edital.data[0].nompreLinkPhoto),
                              title: Text('PRESIDENTE DA MESA'),
                              subtitle: Text(controller.edital.data[0].nompre),
                            ),
                            ListTile(
                              leading: Image.network(
                                  controller.edital.data[0].nomsecLinkPhoto),
                              title: Text('SECRETÁRIO'),
                              subtitle: Text(controller.edital.data[0].nomsec),
                            ),
                            ListTile(
                              leading: Image.network(
                                  controller.edital.data[0].nomsinLinkPhoto),
                              title: Text('SÍNDICO'),
                              subtitle: Text(controller.edital.data[0].nomsin),
                            ),
                          ],
                        ),
                      )
                    : Container()
              ]),
            );
          default:
            return PageError(
              messageError: "Erro ao carregar as informções",
              onPressed: (_) => controller.init(widget.id),
            );
        }
      }),
    );
  }
}
