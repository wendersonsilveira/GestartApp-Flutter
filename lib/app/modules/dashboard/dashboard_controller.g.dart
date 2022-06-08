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
  Computed<bool> _$statusLoadingComputed;

  @override
  bool get statusLoading =>
      (_$statusLoadingComputed ??= Computed<bool>(() => super.statusLoading,
              name: '_DashboardControllerBase.statusLoading'))
          .value;
  Computed<bool> _$isSindicoComputed;

  @override
  bool get isSindico =>
      (_$isSindicoComputed ??= Computed<bool>(() => super.isSindico,
              name: '_DashboardControllerBase.isSindico'))
          .value;

  final _$isVisibleAtom = Atom(name: '_DashboardControllerBase.isVisible');

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  final _$versionInfoAtom = Atom(name: '_DashboardControllerBase.versionInfo');

  @override
  String get versionInfo {
    _$versionInfoAtom.reportRead();
    return super.versionInfo;
  }

  @override
  set versionInfo(String value) {
    _$versionInfoAtom.reportWrite(value, super.versionInfo, () {
      super.versionInfo = value;
    });
  }

  final _$storeVersionAtom =
      Atom(name: '_DashboardControllerBase.storeVersion');

  @override
  String get storeVersion {
    _$storeVersionAtom.reportRead();
    return super.storeVersion;
  }

  @override
  set storeVersion(String value) {
    _$storeVersionAtom.reportWrite(value, super.storeVersion, () {
      super.storeVersion = value;
    });
  }

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
  ResourceData<UnidadeAtivaEntity> get condominiosAtivos {
    _$condominiosAtivosAtom.reportRead();
    return super.condominiosAtivos;
  }

  @override
  set condominiosAtivos(ResourceData<UnidadeAtivaEntity> value) {
    _$condominiosAtivosAtom.reportWrite(value, super.condominiosAtivos, () {
      super.condominiosAtivos = value;
    });
  }

  final _$unidadesAtivasAdmAtom =
      Atom(name: '_DashboardControllerBase.unidadesAtivasAdm');

  @override
  ResourceData<List<UnidadeEntity>> get unidadesAtivasAdm {
    _$unidadesAtivasAdmAtom.reportRead();
    return super.unidadesAtivasAdm;
  }

  @override
  set unidadesAtivasAdm(ResourceData<List<UnidadeEntity>> value) {
    _$unidadesAtivasAdmAtom.reportWrite(value, super.unidadesAtivasAdm, () {
      super.unidadesAtivasAdm = value;
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

  final _$servicoReservaDisponivelAtom =
      Atom(name: '_DashboardControllerBase.servicoReservaDisponivel');

  @override
  int get servicoReservaDisponivel {
    _$servicoReservaDisponivelAtom.reportRead();
    return super.servicoReservaDisponivel;
  }

  @override
  set servicoReservaDisponivel(int value) {
    _$servicoReservaDisponivelAtom
        .reportWrite(value, super.servicoReservaDisponivel, () {
      super.servicoReservaDisponivel = value;
    });
  }

  final _$servicoReservaAtom =
      Atom(name: '_DashboardControllerBase.servicoReserva');

  @override
  bool get servicoReserva {
    _$servicoReservaAtom.reportRead();
    return super.servicoReserva;
  }

  @override
  set servicoReserva(bool value) {
    _$servicoReservaAtom.reportWrite(value, super.servicoReserva, () {
      super.servicoReserva = value;
    });
  }

  final _$chekedSindicoAtom =
      Atom(name: '_DashboardControllerBase.chekedSindico');

  @override
  bool get chekedSindico {
    _$chekedSindicoAtom.reportRead();
    return super.chekedSindico;
  }

  @override
  set chekedSindico(bool value) {
    _$chekedSindicoAtom.reportWrite(value, super.chekedSindico, () {
      super.chekedSindico = value;
    });
  }

  final _$setupAtom = Atom(name: '_DashboardControllerBase.setup');

  @override
  ResourceData<SetupEntity> get setup {
    _$setupAtom.reportRead();
    return super.setup;
  }

  @override
  set setup(ResourceData<SetupEntity> value) {
    _$setupAtom.reportWrite(value, super.setup, () {
      super.setup = value;
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
  void checkServicoReservasActive(dynamic value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.checkServicoReservasActive');
    try {
      return super.checkServicoReservasActive(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
versionInfo: ${versionInfo},
storeVersion: ${storeVersion},
condominios: ${condominios},
condominiosAtivos: ${condominiosAtivos},
unidadesAtivasAdm: ${unidadesAtivasAdm},
statusCondominio: ${statusCondominio},
existeCondominiosAtivos: ${existeCondominiosAtivos},
servicoReservaDisponivel: ${servicoReservaDisponivel},
servicoReserva: ${servicoReserva},
chekedSindico: ${chekedSindico},
setup: ${setup},
statusLoading: ${statusLoading},
isSindico: ${isSindico}
    ''';
  }
}
