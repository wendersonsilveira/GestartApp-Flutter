import 'package:Gestart/app/modules/boleto/component/button_expanded_widget.dart';
import 'package:Gestart/app/modules/sindico/relatorios/boletos/boletos-unidade/boletos-detalhes/boletos_detalhes_controller.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_button_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';

class BoletosDetalhesPage extends StatefulWidget {
  final String title;
  final String conts;
  const BoletosDetalhesPage(
      {Key key, this.title = "Detalhes da fatura", this.conts})
      : super(key: key);

  @override
  _BoletosDetalhesPageState createState() => _BoletosDetalhesPageState();
}

class _BoletosDetalhesPageState
    extends ModularState<BoletosDetalhesPage, BoletosDetalhesController> {
  final key = new GlobalKey<ScaffoldState>();
  bool _isOpen = false;
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    controller.init(widget.conts);
  }

  void _shareContent(String value) {
    Share.share(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBarCustom(
          context,
          title: Text(widget.title),
        ),
        body: Observer(builder: (_) {
          switch (controller.boleto.status) {
            case Status.loading:
              return Container(child: CircularProgressCustom());
              break;
            case Status.success:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text((controller.boleto.data[0].nomcom)
                                .toUpperCase()),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: 'Vencimento: '),
                                    TextSpan(
                                        text: UIHelper.formatDateFromDateTime(
                                            controller
                                                .boleto.data[0].datVenUtil),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: 'Valor: '),
                                    TextSpan(
                                        text: (controller.boleto.data[0].valTot)
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.boleto.data[0].exibirCoMensagemAberto ==
                                    1
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        Expanded(
                                          child: Text(
                                            controller.boleto.data[0]
                                                .coMensagemAberto,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      ])
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(FlutterIcons.barcode_ant,
                                            size: 44),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              controller.boleto.data[0]
                                                  .linhaDigitavel,
                                              overflow: TextOverflow.clip,
                                              textAlign: TextAlign.center),
                                        )
                                      ])
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: 
                            DownloadButtonWidget(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              fontSize: 14,
                              title: 'BAIXAR PDF',
                              color: AppColorScheme.backgroundColor,
                              fileName:
                                  'Boleto_${controller.boleto.data[0].nomcom}_${controller.boleto.data[0].id}_${controller.boleto.data[0].codimo}_${UIHelper.formatDate(controller.boleto.data[0].datVen)}.pdf',
                              fileURL: controller.boleto.data[0].linkBoleto,
                              shap: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: AppColorScheme.primaryColor)),
                            ),
                            ),
                        ButtonExpandedWidget(
                          descricao: 'COPIAR CÓDIGO',
                          funcao: () {
                            Clipboard.setData(new ClipboardData(
                                text:
                                    controller.boleto.data[0].linhaDigitavel));
                            key.currentState.showSnackBar(new SnackBar(
                              content: new Text("Código copiado com sucesso"),
                            ));
                          },
                        ),
                        ButtonExpandedWidget(
                          descricao: 'COMPARTILHAR',
                          funcao: () => _shareContent('Boleto Bancário ' +
                              controller.boleto.data[0].linkBoleto),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _isOpen = !_isOpen),
                      child: ExpansionPanelList(
                        children: [
                          ExpansionPanel(
                              headerBuilder: (context, isOpen) {
                                return Container(
                                    padding: EdgeInsets.only(top: 15, left: 15),
                                    child: Text(
                                      'Detalhamento',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'roboto',
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal),
                                    ));
                              },
                              body: Container(
                                  child: Column(
                                children: controller.boleto.data.map((e) {
                                  print(e);
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              '- ${e.histor} - ${UIHelper.moneyFormat(e.valMen)}'),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )),
                              isExpanded: _isOpen)
                        ],
                        expansionCallback: (i, isOPen) =>
                            setState(() => _isOpen = !isOPen),
                      ),
                    )
                  ],
                ),
              );
            default:
              return Container(
                  child: PageError(messageError: 'Erro ao carregar a página'));
          }
        }));
  }
}
