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

  @override
  String toString() {
    return '''
unidades: ${unidades},
tiposTaxa: ${tiposTaxa}
    ''';
  }
}
