// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhar_unidade_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalharUnidadeController = BindInject(
  (i) => DetalharUnidadeController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalharUnidadeController on _DetalharUnidadeControllerBase, Store {
  final _$inadimplenciasUnidadeAtom =
      Atom(name: '_DetalharUnidadeControllerBase.inadimplenciasUnidade');

  @override
  ResourceData<List<InadimplenciaAdmDetalheEntity>> get inadimplenciasUnidade {
    _$inadimplenciasUnidadeAtom.reportRead();
    return super.inadimplenciasUnidade;
  }

  @override
  set inadimplenciasUnidade(
      ResourceData<List<InadimplenciaAdmDetalheEntity>> value) {
    _$inadimplenciasUnidadeAtom.reportWrite(value, super.inadimplenciasUnidade,
        () {
      super.inadimplenciasUnidade = value;
    });
  }

  final _$getInadimplenciasUnidadeAsyncAction =
      AsyncAction('_DetalharUnidadeControllerBase.getInadimplenciasUnidade');

  @override
  Future getInadimplenciasUnidade(SendParamsRelInadimplenciaEntity params) {
    return _$getInadimplenciasUnidadeAsyncAction
        .run(() => super.getInadimplenciasUnidade(params));
  }

  @override
  String toString() {
    return '''
inadimplenciasUnidade: ${inadimplenciasUnidade}
    ''';
  }
}
