// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatorio_inadimplencia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RelatorioInadimplenciaController = BindInject(
  (i) => RelatorioInadimplenciaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RelatorioInadimplenciaController
    on _RelatorioInadimplenciaControllerBase, Store {
  final _$unidadesAtom =
      Atom(name: '_RelatorioInadimplenciaControllerBase.unidades');

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

  final _$tiposTaxaAtom =
      Atom(name: '_RelatorioInadimplenciaControllerBase.tiposTaxa');

  @override
  ResourceData<List<TaxaEntity>> get tiposTaxa {
    _$tiposTaxaAtom.reportRead();
    return super.tiposTaxa;
  }

  @override
  set tiposTaxa(ResourceData<List<TaxaEntity>> value) {
    _$tiposTaxaAtom.reportWrite(value, super.tiposTaxa, () {
      super.tiposTaxa = value;
    });
  }

  final _$getUnidadesAsyncAction =
      AsyncAction('_RelatorioInadimplenciaControllerBase.getUnidades');

  @override
  Future getUnidades() {
    return _$getUnidadesAsyncAction.run(() => super.getUnidades());
  }

  final _$getTiposTaxaAsyncAction =
      AsyncAction('_RelatorioInadimplenciaControllerBase.getTiposTaxa');

  @override
  Future getTiposTaxa() {
    return _$getTiposTaxaAsyncAction.run(() => super.getTiposTaxa());
  }

  final _$_RelatorioInadimplenciaControllerBaseActionController =
      ActionController(name: '_RelatorioInadimplenciaControllerBase');

  @override
  dynamic setDataInicial(dynamic value) {
    final _$actionInfo =
        _$_RelatorioInadimplenciaControllerBaseActionController.startAction(
            name: '_RelatorioInadimplenciaControllerBase.setDataInicial');
    try {
      return super.setDataInicial(value);
    } finally {
      _$_RelatorioInadimplenciaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCodImo(dynamic value) {
    final _$actionInfo = _$_RelatorioInadimplenciaControllerBaseActionController
        .startAction(name: '_RelatorioInadimplenciaControllerBase.setCodImo');
    try {
      return super.setCodImo(value);
    } finally {
      _$_RelatorioInadimplenciaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDataFinal(dynamic value) {
    final _$actionInfo =
        _$_RelatorioInadimplenciaControllerBaseActionController.startAction(
            name: '_RelatorioInadimplenciaControllerBase.setDataFinal');
    try {
      return super.setDataFinal(value);
    } finally {
      _$_RelatorioInadimplenciaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipCob(dynamic value) {
    final _$actionInfo = _$_RelatorioInadimplenciaControllerBaseActionController
        .startAction(name: '_RelatorioInadimplenciaControllerBase.setTipCob');
    try {
      return super.setTipCob(value);
    } finally {
      _$_RelatorioInadimplenciaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipTax(dynamic value) {
    final _$actionInfo = _$_RelatorioInadimplenciaControllerBaseActionController
        .startAction(name: '_RelatorioInadimplenciaControllerBase.setTipTax');
    try {
      return super.setTipTax(value);
    } finally {
      _$_RelatorioInadimplenciaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
unidades: ${unidades},
tiposTaxa: ${tiposTaxa}
    ''';
  }
}
