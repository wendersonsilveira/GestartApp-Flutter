// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listar_inadimplencias_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListaInadimplenciasController = BindInject(
  (i) => ListaInadimplenciasController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaInadimplenciasController
    on _ListaInadimplenciasControllerBase, Store {
  final _$codConAtom = Atom(name: '_ListaInadimplenciasControllerBase.codCon');

  @override
  int get codCon {
    _$codConAtom.reportRead();
    return super.codCon;
  }

  @override
  set codCon(int value) {
    _$codConAtom.reportWrite(value, super.codCon, () {
      super.codCon = value;
    });
  }

  final _$inadimplenciasAdmAtom =
      Atom(name: '_ListaInadimplenciasControllerBase.inadimplenciasAdm');

  @override
  ResourceData<List<InadimplenciaAdmEntity>> get inadimplenciasAdm {
    _$inadimplenciasAdmAtom.reportRead();
    return super.inadimplenciasAdm;
  }

  @override
  set inadimplenciasAdm(ResourceData<List<InadimplenciaAdmEntity>> value) {
    _$inadimplenciasAdmAtom.reportWrite(value, super.inadimplenciasAdm, () {
      super.inadimplenciasAdm = value;
    });
  }

  final _$getInadimplenciasAsyncAction =
      AsyncAction('_ListaInadimplenciasControllerBase.getInadimplencias');

  @override
  Future<void> getInadimplencias(dynamic params) {
    return _$getInadimplenciasAsyncAction
        .run(() => super.getInadimplencias(params));
  }

  final _$getInadimplenciasPDFAsyncAction =
      AsyncAction('_ListaInadimplenciasControllerBase.getInadimplenciasPDF');

  @override
  Future<void> getInadimplenciasPDF(SendParamsRelReservaEntity params) {
    return _$getInadimplenciasPDFAsyncAction
        .run(() => super.getInadimplenciasPDF(params));
  }

  @override
  String toString() {
    return '''
codCon: ${codCon},
inadimplenciasAdm: ${inadimplenciasAdm}
    ''';
  }
}
