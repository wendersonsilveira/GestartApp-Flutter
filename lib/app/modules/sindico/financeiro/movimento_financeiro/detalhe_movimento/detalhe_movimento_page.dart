import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:Gestart/domain/entities/contas/mov_financeiro_entity.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detalhe_movimento_controller.dart';

class DetalheMovimentoPage extends StatefulWidget {
  final ResourceData<List<MovFinanceiroEntity>> movimentacao;
  const DetalheMovimentoPage({Key key, this.movimentacao}) : super(key: key);

  @override
  _DetalheMovimentoPageState createState() => _DetalheMovimentoPageState();
}

class _DetalheMovimentoPageState
    extends ModularState<DetalheMovimentoPage, DetalheMovimentoController> {
  //use 'controller' variable to access controller
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text('Movimento de ${widget.movimentacao.data[0].mesAno}'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
