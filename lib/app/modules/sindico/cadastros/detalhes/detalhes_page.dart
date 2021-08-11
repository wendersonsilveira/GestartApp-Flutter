import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/app/widgets/progress/circuclar_progress_custom.dart';
import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/unidade/unidade_entity.dart';
import 'package:Gestart/domain/usecases/unidade/get_unidade_detalhes_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatefulWidget {
  final int codOrd;
  final int condonUserId;

  const DetalhesPage({Key key, this.codOrd, this.condonUserId}) : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  final _getUnidadeDetalhes = getIt.get<GetUnidadeDetalhesUseCase>();

  UnidadeEntity unidade;

  @override
  void initState() {
    getUnidadeDetalhes();
    super.initState();
  }

  getUnidadeDetalhes() async {
    Map<String, dynamic> ids = {"codOrd": widget.codOrd, "condonUserId": widget.condonUserId};
    ResourceData r = await _getUnidadeDetalhes(ids);
    setState(() {
      unidade = r.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text('Detalhamento da unidade'),
      ),
      body: unidade == null
          ? CircularProgressCustom()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg-green.old.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: Container(
                              width: 70,
                              padding: EdgeInsets.all(5),
                              child: Image.asset('assets/images/home.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Unidade: ${unidade.codimo}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          unidade.nompro,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.place,
                            color: AppColorScheme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Endereço:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                unidade.endPro,
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.place,
                            color: AppColorScheme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fones:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: unidade.telefones
                                    .map(
                                      (e) => Text(
                                        e['FONE'],
                                        style: TextStyle(color: AppColorScheme.primaryColor),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.place,
                            color: AppColorScheme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'E-mails:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: unidade.emails
                                    .map(
                                      (e) => Text(
                                        e['EMAIL'],
                                        style: TextStyle(color: AppColorScheme.primaryColor),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Icons.pets,
                                color: AppColorScheme.primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Text('Pets:'),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: unidade.petsList.length > 0
                              ? Column(
                                  children: unidade.petsList
                                      .map(
                                        (e) => Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Nome: ${e['NOME']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                            Text('Porte: ${e['PORTE']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                            Text('${e['TIPO']}, Raça: ${e['RACA']}'),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                )
                              : Text('Não possui'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Icons.pets,
                                color: AppColorScheme.primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Text('Veívulos:'),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: unidade.veiculosList.length > 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: unidade.veiculosList
                                      .map(
                                        (e) => Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${e['PLACA']} - ${e['MODELO']}', style: TextStyle(fontWeight: FontWeight.bold)),
                                            Text('${e['COR']} -  ${e['ANO']}'),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                )
                              : Text('Não possui'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
