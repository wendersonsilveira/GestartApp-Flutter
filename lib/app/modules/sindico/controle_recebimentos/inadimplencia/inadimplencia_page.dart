import 'package:Gestart/app/modules/sindico/controle_recebimentos/components/filtro_inadim_wigedt.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/styles/app_images.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/list/icon_list_item.widget.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/inadimplencia_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_inadinplencias_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'inadimplecia_detalhes_page.dart';

class InadimplenciaPage extends StatefulWidget {
  const InadimplenciaPage({Key key}) : super(key: key);

  @override
  _InadimplenciaPageState createState() => _InadimplenciaPageState();
}

class _InadimplenciaPageState extends State<InadimplenciaPage> {
  final _getInadimplencias = getIt.get<GetInadimplenciasUseCase>();
  List<InadimplenciaEntity> inadimplencias = [];
  bool isLoading = false;
  String total = '';
  Map<String, dynamic> filtro = FiltroInadimWdget.filtro;
  Map<String, dynamic> header = {'unidade': 'Todas', 'taxa': 'Todas'};

  @override
  void initState() {
    getInadimplencias(filtro);
    super.initState();
  }

  setHeader(newHeader) {
    setState(() {
      header = newHeader;
    });
  }

  getInadimplencias(f) async {
    setState(() {
      isLoading = true;
    });
    var storage = await SharedPreferences.getInstance();
    f['CODCON'] = storage.getInt('codCon');

    ResourceData r = await _getInadimplencias(f);
    double t = 0;
    if (r.data != null) {
      for (InadimplenciaEntity item in r.data) {
        t += item.total;
      }
    }
    setState(() {
      isLoading = false;
      inadimplencias = r.data ?? [];
      total = UIHelper.moneyFormat(t);
    });
  }

  Future<void> getFiltro() async {
    return showDialog(
      context: context,
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(20),
        children: [
          FiltroInadimWdget(
            onSubmit: (filtter) {
              getInadimplencias(filtter);
              Modular.navigator.pop();
            },
            getHeader: setHeader,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text('Inadimplência'),
        actions: [
          TextButton(
            onPressed: getFiltro,
            child: Text(
              'FILTRO',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          !isLoading
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('Unidade:')),
                          Expanded(
                            child: Text('${header['unidade']}'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('Taxa:')),
                          Expanded(
                            child: Text('${header['taxa']}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          isLoading
              ? Expanded(child: CircularProgressCustom())
              : inadimplencias.length > 0
                  ? Container(
                      child: Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemCount: inadimplencias.length,
                          itemBuilder: (_, index) {
                            return Card(
                              child: ListTile(
                                leading: IconListItemWidget(
                                  link: inadimplencias[index].linkPhoto,
                                  icon: AppImages.iconCondominio,
                                ),
                                title: Text(inadimplencias[index].unidade),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Tipo Cobrança: ${inadimplencias[index].tipcobDescri}'),
                                    Text(
                                        'TOTAL: ${UIHelper.moneyFormat(inadimplencias[index].total)}'),
                                  ],
                                ),
                                trailing: Icon(Icons.chevron_right),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InadimplenciaDetalhesPage(
                                        filtro: filtro,
                                        codOrd: inadimplencias[index].codOrd,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Text('Sem dados'),
          !isLoading
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Total'), Text(total.toString())],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
