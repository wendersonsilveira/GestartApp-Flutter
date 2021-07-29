import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_tipos_taxa_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_adm_unidades_prop_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltroWdget extends StatefulWidget {
  final Function onSubmit;
  static Map<String, dynamic> filtro = {"CODORD": 0, "TIPTAX": "0", "DATPAG_1": "2021-07-02", "DATPAG_2": "2021-07-30"};

  const FiltroWdget({Key key, this.onSubmit}) : super(key: key);

  @override
  _FiltroWdgetState createState() => _FiltroWdgetState();
}

class _FiltroWdgetState extends State<FiltroWdget> {
  final _getTiposTaxa = getIt.get<GetTiposTaxaUseCase>();
  List<TipoTaxaEntity> tipos = [];
  Map<String, dynamic> filtro = FiltroWdget.filtro;
  final _getUnidades = getIt.get<GetAdmunidadesProprietariosUseCase>();
  List<UnidadeEntity> unidades = [];
  DateTime datePag1 = DateTime.now().subtract(Duration(days: 30));
  DateTime datePag2 = DateTime.now();
  @override
  void initState() {
    super.initState();
    getTiposTaxa();
  }

  getTiposTaxa() async {
    var storage = await SharedPreferences.getInstance();
    var condCon = storage.getInt('codCon');

    filtro['CODCON'] = condCon;

    ResourceData r = await _getTiposTaxa(filtro['CODCON']);

    getUnidades();

    setState(() {
      r.data.insert(0, TipoTaxaEntity(tipTax: '0', desTax: 'Todas'));
      tipos = r.data;
    });
  }

  getUnidades() async {
    var r = await _getUnidades(filtro['CODCON']);
    setState(() {
      unidades = r.data;
    });
  }

  _showDatePicker1() {
    showDatePicker(
      context: context,
      locale: Locale.fromSubtags(languageCode: 'pt'),
      initialDate: datePag1,
      firstDate: DateTime.now().subtract(
        Duration(days: 365 * 5),
      ),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        datePag1 = value;
        filtro['DATPAG_1'] = UIHelper.formatDateFromDateTimeReverse(datePag1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 50) / 100,
      width: MediaQuery.of(context).size.width - 50,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[500], width: 1))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data de pagamento'),
                TextButton(
                    onPressed: _showDatePicker1,
                    child: Row(
                      children: [Text(UIHelper.formatDate(datePag1)), Icon(Icons.arrow_drop_down)],
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Unidade'),
                DropdownButtonFormField(
                  value: null,
                  isExpanded: true,
                  items: unidades
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(
                            '${e.codimo} -  ${e.nompro}',
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          value: e.codord,
                        ),
                      )
                      .toList(),
                  onChanged: (int value) {
                    filtro['CODORD'] = value;
                  },
                  hint: Text('Selecione...'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tipo de taxa'),
                DropdownButtonFormField(
                  value: null,
                  items: tipos
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.desTax),
                          value: e.tipTax,
                        ),
                      )
                      .toList(),
                  onChanged: (String value) {
                    filtro['TIPTAX'] = value;
                  },
                  hint: Text('Selecione...'),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () => widget.onSubmit(filtro),
            child: Text('APLICAR'),
          ),
        ],
      ),
    );
  }
}
