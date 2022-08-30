// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boleto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BoletoController = BindInject(
  (i) => BoletoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoletoController on _BoletoControllerBase, Store {
  final _$unidadesAtom = Atom(name: '_BoletoControllerBase.unidades');

  @override
  ResourceData<List<UnidadeEntity>> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(ResourceData<List<UnidadeEntity>> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$listaViewAtom = Atom(name: '_BoletoControllerBase.listaView');

  @override
  List<BoletoEntity> get listaView {
    _$listaViewAtom.reportRead();
    return super.listaView;
  }

  @override
  set listaView(List<BoletoEntity> value) {
    _$listaViewAtom.reportWrite(value, super.listaView, () {
      super.listaView = value;
    });
  }

  final _$statusAtom = Atom(name: '_BoletoControllerBase.status');

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$boletosAtom = Atom(name: '_BoletoControllerBase.boletos');

  @override
  ResourceData<List<BoletoEntity>> get boletos {
    _$boletosAtom.reportRead();
    return super.boletos;
  }

  @override
  set boletos(ResourceData<List<BoletoEntity>> value) {
    _$boletosAtom.reportWrite(value, super.boletos, () {
      super.boletos = value;
    });
  }

  final _$codOrdAtom = Atom(name: '_BoletoControllerBase.codOrd');

  @override
  int get codOrd {
    _$codOrdAtom.reportRead();
    return super.codOrd;
  }

  @override
  set codOrd(int value) {
    _$codOrdAtom.reportWrite(value, super.codOrd, () {
      super.codOrd = value;
    });
  }

  final _$unidadeSelecionadaAtom =
      Atom(name: '_BoletoControllerBase.unidadeSelecionada');

  @override
  bool get unidadeSelecionada {
    _$unidadeSelecionadaAtom.reportRead();
    return super.unidadeSelecionada;
  }

  @override
  set unidadeSelecionada(bool value) {
    _$unidadeSelecionadaAtom.reportWrite(value, super.unidadeSelecionada, () {
      super.unidadeSelecionada = value;
    });
  }

  final _$getBoletosAsyncAction =
      AsyncAction('_BoletoControllerBase.getBoletos');

  @override
  Future<void> getBoletos(int codOrd) {
    return _$getBoletosAsyncAction.run(() => super.getBoletos(codOrd));
  }

  final _$getBoletoDetalhesAsyncAction =
      AsyncAction('_BoletoControllerBase.getBoletoDetalhes');

  @override
  Future<void> getBoletoDetalhes(String conts) {
    return _$getBoletoDetalhesAsyncAction
        .run(() => super.getBoletoDetalhes(conts));
  }

  final _$getUnidadesAsyncAction =
      AsyncAction('_BoletoControllerBase.getUnidades');

  @override
  Future<void> getUnidades() {
    return _$getUnidadesAsyncAction.run(() => super.getUnidades());
  }

  final _$_BoletoControllerBaseActionController =
      ActionController(name: '_BoletoControllerBase');

  @override
  dynamic changeDropdown(int codOrd) {
    final _$actionInfo = _$_BoletoControllerBaseActionController.startAction(
        name: '_BoletoControllerBase.changeDropdown');
    try {
      return super.changeDropdown(codOrd);
    } finally {
      _$_BoletoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
unidades: ${unidades},
listaView: ${listaView},
status: ${status},
boletos: ${boletos},
codOrd: ${codOrd},
unidadeSelecionada: ${unidadeSelecionada}
    ''';
  }
}
