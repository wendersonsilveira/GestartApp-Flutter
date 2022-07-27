// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastros_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastrosController = BindInject(
  (i) => CadastrosController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastrosController on _CadastrosControllerBase, Store {
  final _$codConAtom = Atom(name: '_CadastrosControllerBase.codCon');

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

  final _$resumoAtom = Atom(name: '_CadastrosControllerBase.resumo');

  @override
  ResumoUnidadeEntity get resumo {
    _$resumoAtom.reportRead();
    return super.resumo;
  }

  @override
  set resumo(ResumoUnidadeEntity value) {
    _$resumoAtom.reportWrite(value, super.resumo, () {
      super.resumo = value;
    });
  }

  final _$unidadesAtom = Atom(name: '_CadastrosControllerBase.unidades');

  @override
  List<UnidadeEntity> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(List<UnidadeEntity> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$isLoadingNexAtom =
      Atom(name: '_CadastrosControllerBase.isLoadingNex');

  @override
  bool get isLoadingNex {
    _$isLoadingNexAtom.reportRead();
    return super.isLoadingNex;
  }

  @override
  set isLoadingNex(bool value) {
    _$isLoadingNexAtom.reportWrite(value, super.isLoadingNex, () {
      super.isLoadingNex = value;
    });
  }

  final _$finalListAtom = Atom(name: '_CadastrosControllerBase.finalList');

  @override
  bool get finalList {
    _$finalListAtom.reportRead();
    return super.finalList;
  }

  @override
  set finalList(bool value) {
    _$finalListAtom.reportWrite(value, super.finalList, () {
      super.finalList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CadastrosControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getResumoAsyncAction =
      AsyncAction('_CadastrosControllerBase.getResumo');

  @override
  Future getResumo() {
    return _$getResumoAsyncAction.run(() => super.getResumo());
  }

  final _$getUnidadesAsyncAction =
      AsyncAction('_CadastrosControllerBase.getUnidades');

  @override
  Future getUnidades(Map<String, dynamic> filtro) {
    return _$getUnidadesAsyncAction.run(() => super.getUnidades(filtro));
  }

  @override
  String toString() {
    return '''
codCon: ${codCon},
resumo: ${resumo},
unidades: ${unidades},
isLoadingNex: ${isLoadingNex},
finalList: ${finalList},
isLoading: ${isLoading}
    ''';
  }
}
