import 'package:Gestart/app/styles/app_color_scheme.dart';
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

class FiltroInadimWdget extends StatefulWidget {
  final Function onSubmit;

  final Function getHeader;

  static Map<String, dynamic> filtro = {"CODORD": 0, "TIPTAX": "0", "CODIMO": ''};

  const FiltroInadimWdget({Key key, this.onSubmit, this.getHeader}) : super(key: key);

  @override
  _FiltroInadimWdgetState createState() => _FiltroInadimWdgetState();
}

class _FiltroInadimWdgetState extends State<FiltroInadimWdget> {
  final _getTiposTaxa = getIt.get<GetTiposTaxaUseCase>();
  List<TipoTaxaEntity> tipos = [];
  Map<String, dynamic> filtro = FiltroInadimWdget.filtro;
  final _getUnidades = getIt.get<GetAdmunidadesProprietariosUseCase>();
  List<UnidadeEntity> unidades = [];

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
      r.data.insert(0, UnidadeEntity(codord: 0, nompro: 'Todas'));
      unidades = r.data;
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
    return unidades.length > 0 && tipos.length > 0
        ? Column(
            children: [
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
        : CircularProgressCustom();
  }
}
