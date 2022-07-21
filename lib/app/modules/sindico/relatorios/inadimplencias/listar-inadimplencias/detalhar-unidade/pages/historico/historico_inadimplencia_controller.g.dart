// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_inadimplencia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HistoricoInadimplenciaController = BindInject(
  (i) => HistoricoInadimplenciaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricoInadimplenciaController
    on _HistoricoIndimplenciaControllerBase, Store {
  final _$historicoInadimplenciasUnidadeAtom = Atom(
      name:
          '_HistoricoIndimplenciaControllerBase.historicoInadimplenciasUnidade');

  @override
  ResourceData<List<HistoricoInadimEntity>> get historicoInadimplenciasUnidade {
    _$historicoInadimplenciasUnidadeAtom.reportRead();
    return super.historicoInadimplenciasUnidade;
  }

  @override
  set historicoInadimplenciasUnidade(
      ResourceData<List<HistoricoInadimEntity>> value) {
    _$historicoInadimplenciasUnidadeAtom
        .reportWrite(value, super.historicoInadimplenciasUnidade, () {
      super.historicoInadimplenciasUnidade = value;
    });
  }

  final _$getHistoricoInadimplenciasUnidadeAsyncAction = AsyncAction(
      '_HistoricoIndimplenciaControllerBase.getHistoricoInadimplenciasUnidade');

  @override
  Future getHistoricoInadimplenciasUnidade(int codOrd) {
    return _$getHistoricoInadimplenciasUnidadeAsyncAction
        .run(() => super.getHistoricoInadimplenciasUnidade(codOrd));
  }

  @override
  String toString() {
    return '''
historicoInadimplenciasUnidade: ${historicoInadimplenciasUnidade}
    ''';
  }
}
