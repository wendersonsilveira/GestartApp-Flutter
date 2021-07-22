// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assembleia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AssembleiaController = BindInject(
  (i) => AssembleiaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssembleiaController on _AssembleiaControllerBase, Store {
  final _$editaisAtom = Atom(name: '_AssembleiaControllerBase.editais');

  @override
  ResourceData<List<AssembleiaEntity>> get editais {
    _$editaisAtom.reportRead();
    return super.editais;
  }

  @override
  set editais(ResourceData<List<AssembleiaEntity>> value) {
    _$editaisAtom.reportWrite(value, super.editais, () {
      super.editais = value;
    });
  }

  final _$listaViewAtom = Atom(name: '_AssembleiaControllerBase.listaView');

  @override
  List<AssembleiaEntity> get listaView {
    _$listaViewAtom.reportRead();
    return super.listaView;
  }

  @override
  set listaView(List<AssembleiaEntity> value) {
    _$listaViewAtom.reportWrite(value, super.listaView, () {
      super.listaView = value;
    });
  }

  final _$condominiosAtom = Atom(name: '_AssembleiaControllerBase.condominios');

  @override
  ResourceData<List<CondominiosAtivosEntity>> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(ResourceData<List<CondominiosAtivosEntity>> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$codConAtom = Atom(name: '_AssembleiaControllerBase.codCon');

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

  final _$initAsyncAction = AsyncAction('_AssembleiaControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getEditaisAsyncAction =
      AsyncAction('_AssembleiaControllerBase.getEditais');

  @override
  Future getEditais() {
    return _$getEditaisAsyncAction.run(() => super.getEditais());
  }

  final _$_AssembleiaControllerBaseActionController =
      ActionController(name: '_AssembleiaControllerBase');

  @override
  dynamic changeDropdown(int codCond) {
    final _$actionInfo = _$_AssembleiaControllerBaseActionController
        .startAction(name: '_AssembleiaControllerBase.changeDropdown');
    try {
      return super.changeDropdown(codCond);
    } finally {
      _$_AssembleiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterAssembleias(int id) {
    final _$actionInfo = _$_AssembleiaControllerBaseActionController
        .startAction(name: '_AssembleiaControllerBase.filterAssembleias');
    try {
      return super.filterAssembleias(id);
    } finally {
      _$_AssembleiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editais: ${editais},
listaView: ${listaView},
condominios: ${condominios},
codCon: ${codCon}
    ''';
  }
}
