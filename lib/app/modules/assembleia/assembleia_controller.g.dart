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
  final _$condsAtom = Atom(name: '_AssembleiaControllerBase.conds');

  @override
  List<CondominioEntity> get conds {
    _$condsAtom.reportRead();
    return super.conds;
  }

  @override
  set conds(List<CondominioEntity> value) {
    _$condsAtom.reportWrite(value, super.conds, () {
      super.conds = value;
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
  List<CondominioEntity> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(List<CondominioEntity> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AssembleiaControllerBase.loading');

  @override
  int get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(int value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getEditaisAsyncAction =
      AsyncAction('_AssembleiaControllerBase.getEditais');

  @override
  Future getEditais() {
    return _$getEditaisAsyncAction.run(() => super.getEditais());
  }

  final _$convertEditaisToCondominiosAsyncAction =
      AsyncAction('_AssembleiaControllerBase.convertEditaisToCondominios');

  @override
  Future convertEditaisToCondominios() {
    return _$convertEditaisToCondominiosAsyncAction
        .run(() => super.convertEditaisToCondominios());
  }

  final _$_AssembleiaControllerBaseActionController =
      ActionController(name: '_AssembleiaControllerBase');

  @override
  void alterarCondicao() {
    final _$actionInfo = _$_AssembleiaControllerBaseActionController
        .startAction(name: '_AssembleiaControllerBase.alterarCondicao');
    try {
      return super.alterarCondicao();
    } finally {
      _$_AssembleiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarCond(dynamic value) {
    final _$actionInfo = _$_AssembleiaControllerBaseActionController
        .startAction(name: '_AssembleiaControllerBase.alterarCond');
    try {
      return super.alterarCond(value);
    } finally {
      _$_AssembleiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
conds: ${conds},
listaView: ${listaView},
condominios: ${condominios},
loading: ${loading}
    ''';
  }
}
