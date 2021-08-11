import 'package:Gestart/app/modules/sindico/cadastros/components/dropdown_filtro_widget.dart';
import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltroUnidadeWdget extends StatefulWidget {
  final Function onSubmit;

  final Function getHeader;

  final Map<String, dynamic> filtro;

  const FiltroUnidadeWdget({Key key, this.onSubmit, this.getHeader, this.filtro}) : super(key: key);

  @override
  _FiltroUnidadeWdgetState createState() => _FiltroUnidadeWdgetState();
}

class _FiltroUnidadeWdgetState extends State<FiltroUnidadeWdget> {
  bool isLoading = false;

  Map<String, dynamic> filtro = {
    "FILTER_IS_USER": null,
    "FILTER_HAS_INQUILINO": null,
    "FILTER_HAS_PETS": null,
    "FILTER_HAS_VEICULOS": null,
    "FILTER_ARGUMENTO": null,
    "FILTER_OFFSET": null,
    "FILTER_LIMIT": null,
  };

  Map<String, dynamic> headerTpl = {
    "FILTER_IS_USER": {1: 'Usuários ativos', 0: 'Usuários potenciais'},
    "FILTER_HAS_INQUILINO": {1: 'Tem inquilino', 0: 'Não tem inquilino'},
    "FILTER_HAS_PETS": {1: 'Tem pet', 0: 'Não tem pet'},
    "FILTER_HAS_VEICULOS": {1: 'Tem veículo', 0: 'Não tem veículo'}
  };

  List<Map<String, dynamic>> items = [
    {'SIM': 1},
    {'NÃO': 0},
    {'TODOS': null},
  ];

  @override
  void initState() {
    if (widget.filtro != null) {
      filtro = widget.filtro;
      filtro.remove('FILTER_OFFSET');
      filtro.remove('FILTER_LIMIT');
    }
    super.initState();
  }

  getHeader() {
    List<Map<String, dynamic>> headers = [];

    filtro.entries.forEach((element) {
      if (filtro[element.key] != null) {
        headers.add({
          'title': headerTpl[element.key][element.value],
          'key': element.key,
        });
      }
    });

    return headers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      child: !isLoading
          ? Container(
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          filtro['FILTER_ARGUMENTO'] = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Unidade, proprietário, inquilino...',
                        labelText: 'Pesquisar',
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.primaryColor, width: 3.0.h)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.primaryColor, width: 3.0.h)),
                        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.feedbackDangerDark, width: 3.0.h)),
                        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColorScheme.feedbackDangerDark, width: 3.0.h)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('É usuário ativo'),
                        DropdownFilterWidget(
                            value: filtro['FILTER_IS_USER'],
                            items: items,
                            onChanged: (value) {
                              setState(() {
                                filtro['FILTER_IS_USER'] = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Possui inquilinos'),
                        DropdownFilterWidget(
                            value: filtro['FILTER_HAS_INQUILINO'],
                            items: items,
                            onChanged: (value) {
                              setState(() {
                                filtro['FILTER_HAS_INQUILINO'] = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Possui pets'),
                        DropdownFilterWidget(
                            value: filtro['FILTER_HAS_PETS'],
                            items: items,
                            onChanged: (value) {
                              setState(() {
                                filtro['FILTER_HAS_PETS'] = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Possui veiculos'),
                        DropdownFilterWidget(
                            value: filtro['FILTER_HAS_VEICULOS'],
                            items: items,
                            onChanged: (value) {
                              setState(() {
                                filtro['FILTER_HAS_VEICULOS'] = value;
                              });
                            }),
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
              ),
            )
          : CircularProgressCustom(),
    );
  }
}
