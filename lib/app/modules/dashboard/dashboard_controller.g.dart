// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DashboardController = BindInject(
  (i) => DashboardController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$condominiosAtom = Atom(name: '_DashboardControllerBase.condominios');

  @override
  ResourceData<List<CondominioEntity>> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(ResourceData<List<CondominioEntity>> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$condominiosAtivosAtom =
      Atom(name: '_DashboardControllerBase.condominiosAtivos');

  @override
  ResourceData<CondominioAtivoEntity> get condominiosAtivos {
    _$condominiosAtivosAtom.reportRead();
    return super.condominiosAtivos;
  }

  @override
  set condominiosAtivos(ResourceData<CondominioAtivoEntity> value) {
    _$condominiosAtivosAtom.reportWrite(value, super.condominiosAtivos, () {
      super.condominiosAtivos = value;
    });
  }

  final _$statusCondominioAtom =
      Atom(name: '_DashboardControllerBase.statusCondominio');

  @override
  int get statusCondominio {
    _$statusCondominioAtom.reportRead();
    return super.statusCondominio;
  }

  @override
  set statusCondominio(int value) {
    _$statusCondominioAtom.reportWrite(value, super.statusCondominio, () {
      super.statusCondominio = value;
    });
  }

  final _$existeCondominiosAtivosAtom =
      Atom(name: '_DashboardControllerBase.existeCondominiosAtivos');

  @override
  bool get existeCondominiosAtivos {
    _$existeCondominiosAtivosAtom.reportRead();
    return super.existeCondominiosAtivos;
  }

  @override
  set existeCondominiosAtivos(bool value) {
    _$existeCondominiosAtivosAtom
        .reportWrite(value, super.existeCondominiosAtivos, () {
      super.existeCondominiosAtivos = value;
    });
  }

  final _$getInforCondominiosAsyncAction =
      AsyncAction('_DashboardControllerBase.getInforCondominios');

  @override
  Future getInforCondominios() {
    return _$getInforCondominiosAsyncAction
        .run(() => super.getInforCondominios());
  }

  final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase');

  @override
  void mudarStatusCondominio(dynamic value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.mudarStatusCondominio');
    try {
      return super.mudarStatusCondominio(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkCondominiosAtivos(dynamic value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.checkCondominiosAtivos');
    try {
      return super.checkCondominiosAtivos(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
condominios: ${condominios},
condominiosAtivos: ${condominiosAtivos},
statusCondominio: ${statusCondominio},
existeCondominiosAtivos: ${existeCondominiosAtivos}
    ''';
  }
}
