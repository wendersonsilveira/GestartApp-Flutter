// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidencias_inadimplencia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $IncidenciasInadimplenciaController = BindInject(
  (i) => IncidenciasInadimplenciaController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IncidenciasInadimplenciaController
    on _IncidenciasIndimplenciaControllerBase, Store {
  final _$incidenciasInadimplenciasUnidadeAtom = Atom(
      name:
          '_IncidenciasIndimplenciaControllerBase.incidenciasInadimplenciasUnidade');

  @override
  ResourceData<List<IncidenciaInadimplenciasEntity>>
      get incidenciasInadimplenciasUnidade {
    _$incidenciasInadimplenciasUnidadeAtom.reportRead();
    return super.incidenciasInadimplenciasUnidade;
  }

  @override
  set incidenciasInadimplenciasUnidade(
      ResourceData<List<IncidenciaInadimplenciasEntity>> value) {
    _$incidenciasInadimplenciasUnidadeAtom
        .reportWrite(value, super.incidenciasInadimplenciasUnidade, () {
      super.incidenciasInadimplenciasUnidade = value;
    });
  }

  final _$getIncidenciasInadimplenciasUnidadeAsyncAction = AsyncAction(
      '_IncidenciasIndimplenciaControllerBase.getIncidenciasInadimplenciasUnidade');

  @override
  Future getIncidenciasInadimplenciasUnidade(int codOrd) {
    return _$getIncidenciasInadimplenciasUnidadeAsyncAction
        .run(() => super.getIncidenciasInadimplenciasUnidade(codOrd));
  }

  @override
  String toString() {
    return '''
incidenciasInadimplenciasUnidade: ${incidenciasInadimplenciasUnidade}
    ''';
  }
}
