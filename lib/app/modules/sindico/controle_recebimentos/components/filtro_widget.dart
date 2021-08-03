import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/app/widgets/inputs/dropdown_search_custom.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
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

  final Function getHeader;

  static Map<String, dynamic> filtro = {
    "CODORD": 0,
    "TIPTAX": "0",
    "DATPAG_1": UIHelper.formatDateFromDateTimeReverse(DateTime.utc(DateTime.now().year, DateTime.now().month, 01)),
    "DATPAG_2": UIHelper.formatDateFromDateTimeReverse(DateTime.now()),
  };

  const FiltroWdget({Key key, this.onSubmit, this.getHeader}) : super(key: key);

  @override
  _FiltroWdgetState createState() => _FiltroWdgetState();
}

class _FiltroWdgetState extends State<FiltroWdget> {
  final _getTiposTaxa = getIt.get<GetTiposTaxaUseCase>();
  List<TipoTaxaEntity> tipos = [];
  Map<String, dynamic> filtro = FiltroWdget.filtro;
  final _getUnidades = getIt.get<GetAdmunidadesProprietariosUseCase>();
  List<UnidadeEntity> unidades = [];
  DateTime datePag1;
  DateTime datePag2;
  @override
  void initState() {
    super.initState();
    getTiposTaxa();
    datePag1 = DateTime.parse(filtro['DATPAG_1']);
    datePag2 = DateTime.parse(filtro['DATPAG_2']);
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
      r.data.insert(0, UnidadeEntity(codord: 0, nompro: 'Todas'));
      unidades = r.data;
    });
  }

  Future<DateTime> _showDatePicker(DateTime inialDate, DateTime firstDate, DateTime lastDate) {
    return showDatePicker(
      context: context,
      locale: Locale.fromSubtags(languageCode: 'pt'),
      initialDate: inialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  getDatePag1() {
    _showDatePicker(datePag1, DateTime.now().subtract(Duration(days: 365 * 5)), DateTime.now()).then((value) {
      setState(() {
        datePag1 = value;
        filtro['DATPAG_1'] = UIHelper.formatDateFromDateTimeReverse(datePag1);
      });
    });
  }

  getDatePag2() {
    _showDatePicker(datePag2, DateTime.now().subtract(Duration(days: 365 * 5)), DateTime.now()).then((value) {
      setState(() {
        datePag2 = value;
        filtro['DATPAG_2'] = UIHelper.formatDateFromDateTimeReverse(datePag2);
      });
    });
  }

  getHeader() {
    var unidade = unidades.firstWhere((element) => element.codord == filtro['CODORD']);
    var taxa = tipos.firstWhere((element) => element.tipTax == filtro['TIPTAX']);

    var unidText = unidade.codimo == null ? 'Todas' : '${unidade.codimo} - ${unidade.nompro}';

    return {'unidade': unidText, 'taxa': taxa.desTax};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: MediaQuery.of(context).size.width - 50,
      child: unidades.length > 0 && tipos.length > 0
          ? Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[500], width: 1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Data de pagamento'),
                      TextButton(
                          onPressed: getDatePag1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                UIHelper.formatDate(datePag1),
                                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey[700],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[500], width: 1))),
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Até'),
                      TextButton(
                          onPressed: getDatePag2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                UIHelper.formatDate(datePag2),
                                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey[700],
                              ),
                            ],
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
                      DropdownSearchWidget(
                        value: filtro['CODORD'],
                        items: unidades.map((e) {
                          return DropdownSearchItem(
                              title: Text(
                                e.codimo != null ? '${e.codimo} -  ${e.nompro}' : e.nompro,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e.codord);
                        }).toList(),
                        onSelected: (value) {
                          setState(() {
                            filtro['CODORD'] = value;
                          });
                        },
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
                      DropdownSearchWidget(
                        value: filtro['TIPTAX'],
                        items: tipos.map((e) {
                          return DropdownSearchItem(
                              title: Text(
                                e.desTax,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e.tipTax);
                        }).toList(),
                        onSelected: (value) {
                          setState(() {
                            filtro['TIPTAX'] = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  onPressed: () {
                    widget.onSubmit(filtro);
                    widget.getHeader(getHeader());
                  },
                  child: Text(
                    'APLICAR',
                    style: TextStyle(
                      color: AppColorScheme.primaryColor,
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: AppColorScheme.primaryColor, width: 1),
                  ),
                  focusColor: AppColorScheme.primaryColor,
                  hoverColor: AppColorScheme.primaryColor,
                  disabledColor: AppColorScheme.primaryColor,
                  colorBrightness: Brightness.light,
                ),
              ],
            )
          : CircularProgressCustom(),
    );
  }
}
