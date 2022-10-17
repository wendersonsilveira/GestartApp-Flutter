import 'package:Gestart/app/modules/boleto/component/button_expanded_widget.dart';
import 'package:Gestart/app/modules/boleto/component/texto_infor_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/download/download_button_widget.dart';
import 'package:Gestart/app/widgets/page_error/page_error.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import 'detalhe_boleto_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class DetalheBoletoPage extends StatefulWidget {
  final String title;
  final int idBoleto;
  const DetalheBoletoPage(
      {Key key, this.title = "Boleto Digital", this.idBoleto})
      : super(key: key);

  @override
  _DetalheBoletoPageState createState() => _DetalheBoletoPageState();
}

class _DetalheBoletoPageState
    extends ModularState<DetalheBoletoPage, DetalheBoletoController> {
  //use 'controller' variable to access controller
  final key = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    controller.init(idBoleto: widget.idBoleto);
    super.initState();
  }

  void _shareContent(String value) {
    Share.share(value);
  }

  void getUrlParcelamento(String identificador) async {
    var urlConsulta = await controller.buscarLinkParcelamento(identificador);
    _launchURL(urlConsulta.data);
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBarCustom(
        context,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.boleto.status) {
            case Status.success:
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            controller.boleto.data.logo,
                            height: 150.h,
                            width: 150.h,
                          ),
                          title: Text(controller.boleto.data.nomCon,
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontFamily: 'roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: AppColorScheme.neutralDefault2,
                              )),
                        ),
                      ),
                      Divider(),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextoInforWidget(
                                titulo: 'Vencimento',
                                valor: UIHelper.formatDateFromDateTime(
                                    controller.boleto.data.datVen),
                              ),
                              TextoInforWidget(
                                  titulo: 'Valor',
                                  valor: UIHelper.moneyFormat(
                                      controller.boleto.data.valTot))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FlutterIcons.barcode_ant,
                                  size: 80,
                                ),
                                SizedBox(height: 30.h),
                                Text(
                                  controller.boleto.data.linhaDigitavel,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: DownloadButtonWidget(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                fontSize: 14,
                                title: 'BAIXAR PDF',
                                color: AppColorScheme.backgroundColor,
                                fileName:
                                    'Boleto_${controller.boleto.data.apelido}_${controller.boleto.data.id}_${controller.boleto.data.codImo}_${UIHelper.formatDate(controller.boleto.data.datVen)}.pdf',
                                fileURL: controller.boleto.data.linkBoleto,
                                shap: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: AppColorScheme.primaryColor)),
                              ),
                            ),
                            ButtonExpandedWidget(
                              descricao: 'COPIAR CODIGO',
                              funcao: () {
                                Clipboard.setData(new ClipboardData(
                                    text:
                                        controller.boleto.data.linhaDigitavel));
                                key.currentState.showSnackBar(new SnackBar(
                                  content:
                                      new Text("Código copiado com sucesso"),
                                ));
                              },
                            ),
                            ButtonExpandedWidget(
                              descricao: 'COMPARTILHAR',
                              funcao: () => _shareContent('Boleto Bancário ' +
                                  controller.boleto.data.linkBoleto),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isOpen = !_isOpen),
                        child: ExpansionPanelList(
                          children: [
                            ExpansionPanel(
                                headerBuilder: (context, isOpen) {
                                  return Container(
                                      padding:
                                          EdgeInsets.only(top: 15, left: 15),
                                      child: Text(
                                        'Detalhamento',
                                        style: TextStyle(
                                            fontSize: 32.sp,
                                            fontFamily: 'roboto',
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal),
                                      ));
                                },
                                body: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children:
                                          controller.inforBoletos.map((e) {
                                        print(e);
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '- ${e['descricao']} - ${UIHelper.moneyFormat(e['valor'])}'),
                                            Divider()
                                          ],
                                        );
                                      }).toList(),
                                    )),
                                isExpanded: _isOpen)
                          ],
                          expansionCallback: (i, isOPen) =>
                              setState(() => _isOpen = !isOPen),
                        ),
                      )
                    ]),
              );
              break;
            case Status.loading:
              return Center(child: CircularProgressCustom());              

            default:
              return PageError(
                messageError: "Erro ao carregar as informações",
                onPressed: () => controller.init(idBoleto: widget.idBoleto),
              );
          }
        },
      ),
    );
  }
}
