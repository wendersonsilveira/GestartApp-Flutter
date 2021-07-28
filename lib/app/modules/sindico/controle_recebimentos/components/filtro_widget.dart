import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/recebimento/get_tipos_taxa_use_case.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidades_use_case.dart';
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
  final _getUnidades = getIt.get<GetUnidadesUseCase>();
  List<UnidadeEntity> unidades = [];
  @override
  void initState() {
    super.initState();
    getTiposTaxa();
    getUnidades();
  }

  getTiposTaxa() async {
    var storage = await SharedPreferences.getInstance();
    var condCon = storage.getInt('codCon');

    filtro['CODCON'] = condCon;

    ResourceData r = await _getTiposTaxa(filtro['CODCON']);

    setState(() {
      r.data.insert(0, TipoTaxaEntity(tipTax: '0', desTax: 'Todas'));
      tipos = r.data;
    });
  }

  getUnidades() async {
    var r = await _getUnidades();
    setState(() {
      unidades = r.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Unidade'),
                DropdownButtonFormField(
                  value: null,
                  items: unidades
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.apelido),
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
