import 'package:Gestart/app/modules/sindico/controle_recebimentos/components/filtro_widget.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/domain/entities/recebimento/recebimento_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_recebimentos_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:Gestart/di/di.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecebimentosPage extends StatefulWidget {
  final String title;
  const RecebimentosPage({Key key, this.title = 'Recebimentos'}) : super(key: key);

  @override
  _RecebimentosPageState createState() => _RecebimentosPageState();
}

class _RecebimentosPageState extends State<RecebimentosPage> {
  final _getRecebimentos = getIt.get<GetRecebimentosUseCase>();
  List<RecebimentoEntity> recebimentos = [];
  bool isLoading = false;
  String total = '';
  Map<String, dynamic> filtro = FiltroWdget.filtro;

  @override
  void initState() {
    getRecebimentos();
    super.initState();
  }

  getRecebimentos() async {
    setState(() {
      isLoading = true;
    });
    var storage = await SharedPreferences.getInstance();
    filtro['CODCON'] = storage.getInt('codCon');

    ResourceData r = await _getRecebimentos(filtro);
    double t = 0;
    for (var item in r.data) {
      t += item.valor;
    }
    setState(() {
      isLoading = false;
      recebimentos = r.data;
      total = UIHelper.moneyFormat(t);
    });
  }

  Future<void> getFiltro() async {
    return showDialog(
        context: context,
        child: AlertDialog(
          content: FiltroWdget(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        actions: [
          TextButton(
            onPressed: getFiltro,
            child: Text(
              'FILTRO',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text(widget.title),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Modular.navigator.pop();
          },
        ),
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
                          Text('Data do pagamento: '),
                          Text('${UIHelper.formatDateFromString(filtro["DATPAG_1"])} - ${UIHelper.formatDateFromString(filtro["DATPAG_2"])}')
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          isLoading
              ? Expanded(child: CircularProgressCustom())
              : recebimentos.length > 0
                  ? Container(
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: recebimentos.length,
                          itemBuilder: (_, index) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(recebimentos[index].linkPhoto),
                                ),
                                title: Text(recebimentos[index].unidade),
                                subtitle: Text('VALOR: ${UIHelper.moneyFormat(recebimentos[index].valor)}'),
                                trailing: Icon(Icons.chevron_right),
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
