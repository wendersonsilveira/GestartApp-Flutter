import 'package:Gestart/app/modules/sindico/relatorios/inadimplencias/listar-inadimplencias/components/leading_status_cobranca_widget.dart';
import 'package:Gestart/app/utils/ui_helper.dart';

import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_adm_entity.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'listar_inadimplencias_controller.dart';

class ListaInadimplenciasPage extends StatefulWidget {
  final String title;
  final SendParamsRelInadimplenciaEntity params;

  const ListaInadimplenciasPage(
      {Key key, this.title = "Lista de Inadimplencia", this.params})
      : super(key: key);

  @override
  _ListaInadimplenciasPageState createState() =>
      _ListaInadimplenciasPageState();
}

class _ListaInadimplenciasPageState extends ModularState<
    ListaInadimplenciasPage, ListaInadimplenciasController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.params);
  }

  getPageDetalhe(InadimplenciaAdmEntity inadimplencia) {
    SendParamsRelInadimplenciaEntity params2 = SendParamsRelInadimplenciaEntity(
        codCon: widget.params.codCon,
        codOrd: inadimplencia.codOrd,
        datFim: widget.params.datFim,
        datIni: widget.params.datIni);
    Modular.navigator.pushNamed(RouteName.detalharInadimplenciasUnidade,
        arguments: [params2, inadimplencia]);
  }

  SendParamsRelInadimplenciaEntity params3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
          // actions: [
          //   GestureDetector(
          //     onTap: () => {
          //       params3 = SendParamsRelInadimplenciaEntity(
          //         codCon: widget.params.codCon,
          //         codImo: widget.params.codImo,
          //         datIni: widget.params.datIni,
          //         datFim: widget.params.datFim,
          //         codOrd: widget.params.codOrd,
          //         tipo: "PDF",
          //         tipCob: widget.params.tipCob,
          //         tipTax: widget.params.tipTax,
          //       ),
          //       controller.getInadimplenciasPDF(params3)
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.only(right: 8.0),
          //       child: Icon(FlutterIcons.download_ant),
          //     ),
          //   )
          // ],
        ),
        body: Observer(
          builder: (_) {
            switch (controller.inadimplenciasAdm.status) {
              case Status.loading:
                return Center(child: CircularProgressCustom());
                break;
              case Status.failed:
                return Center(
                    child: PageError(
                  messageError: 'Erro ao pesquisar inadimplências.',
                  onPressed: () => {controller.init(widget.params)},
                ));
                break;
              default:
                return Container(
                    child: controller.inadimplenciasAdm.data.isEmpty
                        ? EmptyWidget(
                            descricao: 'Nenhuma inadimplência encontrada',
                          )
                        : ListView.builder(
                            itemCount: controller.inadimplenciasAdm.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                margin: const EdgeInsets.only(
                                    top: 8, left: 4, right: 4),
                                child: ListTile(
                                    onTap: () => getPageDetalhe(controller
                                        .inadimplenciasAdm.data[index]),
                                    trailing: Icon(Icons.chevron_right),
                                    leading: LeadingStatusCobrancaWidget(
                                        tipoCobranca: controller
                                            .inadimplenciasAdm
                                            .data[index]
                                            .tipCobDes),
                                    title: Text(controller.inadimplenciasAdm
                                            .data[index].codImo +
                                        ' - ' +
                                        controller.inadimplenciasAdm.data[index]
                                            .nomPro),
                                    subtitle: Text(UIHelper.moneyFormat(
                                        controller.inadimplenciasAdm.data[index].total))),
                              );
                            }));
            }
          },
        ));
  }
}
