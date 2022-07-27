// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processos_inadimplencia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProcessosInadimplenciaController = BindInject(
  (i) => ProcessosInadimplenciaController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProcessosInadimplenciaController
    on _ProcessosInadimplenciaControllerBase, Store {
  final _$processosInadimplenciasUnidadeAtom = Atom(
      name:
          '_ProcessosInadimplenciaControllerBase.processosInadimplenciasUnidade');

  @override
  ResourceData<List<ProcessoInadimplenciasEntity>>
      get processosInadimplenciasUnidade {
    _$processosInadimplenciasUnidadeAtom.reportRead();
    return super.processosInadimplenciasUnidade;
  }

  @override
  set processosInadimplenciasUnidade(
      ResourceData<List<ProcessoInadimplenciasEntity>> value) {
    _$processosInadimplenciasUnidadeAtom
        .reportWrite(value, super.processosInadimplenciasUnidade, () {
      super.processosInadimplenciasUnidade = value;
    });
  }

  final _$getProcessosInadimplenciasUnidadeAsyncAction = AsyncAction(
      '_ProcessosInadimplenciaControllerBase.getProcessosInadimplenciasUnidade');

  @override
  Future getProcessosInadimplenciasUnidade(int codOrd) {
    return _$getProcessosInadimplenciasUnidadeAsyncAction
        .run(() => super.getProcessosInadimplenciasUnidade(codOrd));
  }

  @override
  String toString() {
    return '''
processosInadimplenciasUnidade: ${processosInadimplenciasUnidade}
    ''';
  }
}
