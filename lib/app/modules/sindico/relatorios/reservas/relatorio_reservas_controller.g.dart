// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorio_reservas_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RelatorioReservasController = BindInject(
  (i) => RelatorioReservasController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RelatorioReservasController on _RelatorioReservasControllerBase, Store {
  final _$espacosAtom = Atom(name: '_RelatorioReservasControllerBase.espacos');

  @override
  ResourceData<List<EspacoEntity>> get espacos {
    _$espacosAtom.reportRead();
    return super.espacos;
  }

  @override
  set espacos(ResourceData<List<EspacoEntity>> value) {
    _$espacosAtom.reportWrite(value, super.espacos, () {
      super.espacos = value;
    });
  }

  final _$unidadesAtom =
      Atom(name: '_RelatorioReservasControllerBase.unidades');

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

  final _$getUnidadesAsyncAction =
      AsyncAction('_RelatorioReservasControllerBase.getUnidades');

  @override
  Future<void> getUnidades() {
    return _$getUnidadesAsyncAction.run(() => super.getUnidades());
  }

  final _$getEspacosAsyncAction =
      AsyncAction('_RelatorioReservasControllerBase.getEspacos');

  @override
  Future<void> getEspacos() {
    return _$getEspacosAsyncAction.run(() => super.getEspacos());
  }

  final _$_RelatorioReservasControllerBaseActionController =
      ActionController(name: '_RelatorioReservasControllerBase');

  @override
  dynamic setUnidade(dynamic value) {
    final _$actionInfo = _$_RelatorioReservasControllerBaseActionController
        .startAction(name: '_RelatorioReservasControllerBase.setUnidade');
    try {
      return super.setUnidade(value);
    } finally {
      _$_RelatorioReservasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEspaco(dynamic value) {
    final _$actionInfo = _$_RelatorioReservasControllerBaseActionController
        .startAction(name: '_RelatorioReservasControllerBase.setEspaco');
    try {
      return super.setEspaco(value);
    } finally {
      _$_RelatorioReservasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDataInicial(dynamic value) {
    final _$actionInfo = _$_RelatorioReservasControllerBaseActionController
        .startAction(name: '_RelatorioReservasControllerBase.setDataInicial');
    try {
      return super.setDataInicial(value);
    } finally {
      _$_RelatorioReservasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDataFinal(dynamic value) {
    final _$actionInfo = _$_RelatorioReservasControllerBaseActionController
        .startAction(name: '_RelatorioReservasControllerBase.setDataFinal');
    try {
      return super.setDataFinal(value);
    } finally {
      _$_RelatorioReservasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(dynamic value) {
    final _$actionInfo = _$_RelatorioReservasControllerBaseActionController
        .startAction(name: '_RelatorioReservasControllerBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_RelatorioReservasControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
espacos: ${espacos},
unidades: ${unidades}
    ''';
  }
}
