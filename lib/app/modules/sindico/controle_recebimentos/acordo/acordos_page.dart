import 'package:Gestart/app/modules/sindico/controle_recebimentos/acordo/acordo_detalhes_page.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/acrodo_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_acordos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gestart/app/widgets/empty/empt_widget.dart';

class AcordosPage extends StatefulWidget {
  const AcordosPage({Key key}) : super(key: key);

  @override
  _AcordosPageState createState() => _AcordosPageState();
}

class _AcordosPageState extends State<AcordosPage> {
  final _getAcordos = getIt.get<GetAcordosUseCase>();

  List<AcordoEntity> acordos;

  @override
  void initState() {
    getAcordos();
    super.initState();
  }

  getAcordos() async {
    var storage = await SharedPreferences.getInstance();
    int codCon = storage.getInt('codCon');
    ResourceData r = await _getAcordos(codCon);

    setState(() {
      acordos = r.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          context,
          title: Text('Acordos Vigentes'),
        ),
        body: acordos == null
            ? CircularProgressCustom()
            : acordos.length > 0
                ? SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: acordos
                            .map(
                              (e) => GestureDetector(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.unidade,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('N° Acordo: ${e.numAco}'),
                                              Text('Tipo: ${e.tipAcoDescri}'),
                                              Text('Parcelas: ${e.totPar}'),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              UIHelper.moneyFormat(
                                                  e.saldoDevedor),
                                            ),
                                            Icon(Icons.chevron_right),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AcordoDetalhesPage(
                                      numAco: e.numAco,
                                    ),
                                  ));
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                : EmptyWidget(
                    descricao: "Não foi encontrado acordos!",
                  ));
  }
}
