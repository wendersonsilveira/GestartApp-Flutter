// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_espaco_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroEspacoController = BindInject(
  (i) => CadastroEspacoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroEspacoController on _CadastroEspacoControllerBase, Store {
  final _$horariosAtom = Atom(name: '_CadastroEspacoControllerBase.horarios');

  @override
  ResourceData<List<HoraEntity>> get horarios {
    _$horariosAtom.reportRead();
    return super.horarios;
  }

  @override
  set horarios(ResourceData<List<HoraEntity>> value) {
    _$horariosAtom.reportWrite(value, super.horarios, () {
      super.horarios = value;
    });
  }

  final _$statusCriacaoAtom =
      Atom(name: '_CadastroEspacoControllerBase.statusCriacao');

  @override
  ResourceData<dynamic> get statusCriacao {
    _$statusCriacaoAtom.reportRead();
    return super.statusCriacao;
  }

  @override
  set statusCriacao(ResourceData<dynamic> value) {
    _$statusCriacaoAtom.reportWrite(value, super.statusCriacao, () {
      super.statusCriacao = value;
    });
  }

  final _$espacoEditarAtom =
      Atom(name: '_CadastroEspacoControllerBase.espacoEditar');

  @override
  ResourceData<EspacoEntity> get espacoEditar {
    _$espacoEditarAtom.reportRead();
    return super.espacoEditar;
  }

  @override
  set espacoEditar(ResourceData<EspacoEntity> value) {
    _$espacoEditarAtom.reportWrite(value, super.espacoEditar, () {
      super.espacoEditar = value;
    });
  }

  final _$tempoMinPermanenciaAtom =
      Atom(name: '_CadastroEspacoControllerBase.tempoMinPermanencia');

  @override
  int get tempoMinPermanencia {
    _$tempoMinPermanenciaAtom.reportRead();
    return super.tempoMinPermanencia;
  }

  @override
  set tempoMinPermanencia(int value) {
    _$tempoMinPermanenciaAtom.reportWrite(value, super.tempoMinPermanencia, () {
      super.tempoMinPermanencia = value;
    });
  }

  final _$tempoMaxPermanenciaAtom =
      Atom(name: '_CadastroEspacoControllerBase.tempoMaxPermanencia');

  @override
  int get tempoMaxPermanencia {
    _$tempoMaxPermanenciaAtom.reportRead();
    return super.tempoMaxPermanencia;
  }

  @override
  set tempoMaxPermanencia(int value) {
    _$tempoMaxPermanenciaAtom.reportWrite(value, super.tempoMaxPermanencia, () {
      super.tempoMaxPermanencia = value;
    });
  }

  final _$tempoMinAntecedenciaAtom =
      Atom(name: '_CadastroEspacoControllerBase.tempoMinAntecedencia');

  @override
  int get tempoMinAntecedencia {
    _$tempoMinAntecedenciaAtom.reportRead();
    return super.tempoMinAntecedencia;
  }

  @override
  set tempoMinAntecedencia(int value) {
    _$tempoMinAntecedenciaAtom.reportWrite(value, super.tempoMinAntecedencia,
        () {
      super.tempoMinAntecedencia = value;
    });
  }

  final _$tempoMaxAntecedenciaAtom =
      Atom(name: '_CadastroEspacoControllerBase.tempoMaxAntecedencia');

  @override
  int get tempoMaxAntecedencia {
    _$tempoMaxAntecedenciaAtom.reportRead();
    return super.tempoMaxAntecedencia;
  }

  @override
  set tempoMaxAntecedencia(int value) {
    _$tempoMaxAntecedenciaAtom.reportWrite(value, super.tempoMaxAntecedencia,
        () {
      super.tempoMaxAntecedencia = value;
    });
  }

  final _$tempoIntervaloReservaAtom =
      Atom(name: '_CadastroEspacoControllerBase.tempoIntervaloReserva');

  @override
  int get tempoIntervaloReserva {
    _$tempoIntervaloReservaAtom.reportRead();
    return super.tempoIntervaloReserva;
  }

  @override
  set tempoIntervaloReserva(int value) {
    _$tempoIntervaloReservaAtom.reportWrite(value, super.tempoIntervaloReserva,
        () {
      super.tempoIntervaloReserva = value;
    });
  }

  final _$ativarDomAtom = Atom(name: '_CadastroEspacoControllerBase.ativarDom');

  @override
  bool get ativarDom {
    _$ativarDomAtom.reportRead();
    return super.ativarDom;
  }

  @override
  set ativarDom(bool value) {
    _$ativarDomAtom.reportWrite(value, super.ativarDom, () {
      super.ativarDom = value;
    });
  }

  final _$ativarSegAtom = Atom(name: '_CadastroEspacoControllerBase.ativarSeg');

  @override
  bool get ativarSeg {
    _$ativarSegAtom.reportRead();
    return super.ativarSeg;
  }

  @override
  set ativarSeg(bool value) {
    _$ativarSegAtom.reportWrite(value, super.ativarSeg, () {
      super.ativarSeg = value;
    });
  }

  final _$ativarTerAtom = Atom(name: '_CadastroEspacoControllerBase.ativarTer');

  @override
  bool get ativarTer {
    _$ativarTerAtom.reportRead();
    return super.ativarTer;
  }

  @override
  set ativarTer(bool value) {
    _$ativarTerAtom.reportWrite(value, super.ativarTer, () {
      super.ativarTer = value;
    });
  }

  final _$ativarQuaAtom = Atom(name: '_CadastroEspacoControllerBase.ativarQua');

  @override
  bool get ativarQua {
    _$ativarQuaAtom.reportRead();
    return super.ativarQua;
  }

  @override
  set ativarQua(bool value) {
    _$ativarQuaAtom.reportWrite(value, super.ativarQua, () {
      super.ativarQua = value;
    });
  }

  final _$ativarQuiAtom = Atom(name: '_CadastroEspacoControllerBase.ativarQui');

  @override
  bool get ativarQui {
    _$ativarQuiAtom.reportRead();
    return super.ativarQui;
  }

  @override
  set ativarQui(bool value) {
    _$ativarQuiAtom.reportWrite(value, super.ativarQui, () {
      super.ativarQui = value;
    });
  }

  final _$ativarSexAtom = Atom(name: '_CadastroEspacoControllerBase.ativarSex');

  @override
  bool get ativarSex {
    _$ativarSexAtom.reportRead();
    return super.ativarSex;
  }

  @override
  set ativarSex(bool value) {
    _$ativarSexAtom.reportWrite(value, super.ativarSex, () {
      super.ativarSex = value;
    });
  }

  final _$ativarSabAtom = Atom(name: '_CadastroEspacoControllerBase.ativarSab');

  @override
  bool get ativarSab {
    _$ativarSabAtom.reportRead();
    return super.ativarSab;
  }

  @override
  set ativarSab(bool value) {
    _$ativarSabAtom.reportWrite(value, super.ativarSab, () {
      super.ativarSab = value;
    });
  }

  final _$autorizacaoResponsavelAtom =
      Atom(name: '_CadastroEspacoControllerBase.autorizacaoResponsavel');

  @override
  bool get autorizacaoResponsavel {
    _$autorizacaoResponsavelAtom.reportRead();
    return super.autorizacaoResponsavel;
  }

  @override
  set autorizacaoResponsavel(bool value) {
    _$autorizacaoResponsavelAtom
        .reportWrite(value, super.autorizacaoResponsavel, () {
      super.autorizacaoResponsavel = value;
    });
  }

  final _$apenasProprietarioReservaAtom =
      Atom(name: '_CadastroEspacoControllerBase.apenasProprietarioReserva');

  @override
  bool get apenasProprietarioReserva {
    _$apenasProprietarioReservaAtom.reportRead();
    return super.apenasProprietarioReserva;
  }

  @override
  set apenasProprietarioReserva(bool value) {
    _$apenasProprietarioReservaAtom
        .reportWrite(value, super.apenasProprietarioReserva, () {
      super.apenasProprietarioReserva = value;
    });
  }

  final _$domIniAtom = Atom(name: '_CadastroEspacoControllerBase.domIni');

  @override
  int get domIni {
    _$domIniAtom.reportRead();
    return super.domIni;
  }

  @override
  set domIni(int value) {
    _$domIniAtom.reportWrite(value, super.domIni, () {
      super.domIni = value;
    });
  }

  final _$domFimAtom = Atom(name: '_CadastroEspacoControllerBase.domFim');

  @override
  int get domFim {
    _$domFimAtom.reportRead();
    return super.domFim;
  }

  @override
  set domFim(int value) {
    _$domFimAtom.reportWrite(value, super.domFim, () {
      super.domFim = value;
    });
  }

  final _$segIniAtom = Atom(name: '_CadastroEspacoControllerBase.segIni');

  @override
  int get segIni {
    _$segIniAtom.reportRead();
    return super.segIni;
  }

  @override
  set segIni(int value) {
    _$segIniAtom.reportWrite(value, super.segIni, () {
      super.segIni = value;
    });
  }

  final _$segFimAtom = Atom(name: '_CadastroEspacoControllerBase.segFim');

  @override
  int get segFim {
    _$segFimAtom.reportRead();
    return super.segFim;
  }

  @override
  set segFim(int value) {
    _$segFimAtom.reportWrite(value, super.segFim, () {
      super.segFim = value;
    });
  }

  final _$terIniAtom = Atom(name: '_CadastroEspacoControllerBase.terIni');

  @override
  int get terIni {
    _$terIniAtom.reportRead();
    return super.terIni;
  }

  @override
  set terIni(int value) {
    _$terIniAtom.reportWrite(value, super.terIni, () {
      super.terIni = value;
    });
  }

  final _$terFimAtom = Atom(name: '_CadastroEspacoControllerBase.terFim');

  @override
  int get terFim {
    _$terFimAtom.reportRead();
    return super.terFim;
  }

  @override
  set terFim(int value) {
    _$terFimAtom.reportWrite(value, super.terFim, () {
      super.terFim = value;
    });
  }

  final _$quaIniAtom = Atom(name: '_CadastroEspacoControllerBase.quaIni');

  @override
  int get quaIni {
    _$quaIniAtom.reportRead();
    return super.quaIni;
  }

  @override
  set quaIni(int value) {
    _$quaIniAtom.reportWrite(value, super.quaIni, () {
      super.quaIni = value;
    });
  }

  final _$quaFimAtom = Atom(name: '_CadastroEspacoControllerBase.quaFim');

  @override
  int get quaFim {
    _$quaFimAtom.reportRead();
    return super.quaFim;
  }

  @override
  set quaFim(int value) {
    _$quaFimAtom.reportWrite(value, super.quaFim, () {
      super.quaFim = value;
    });
  }

  final _$quiIniAtom = Atom(name: '_CadastroEspacoControllerBase.quiIni');

  @override
  int get quiIni {
    _$quiIniAtom.reportRead();
    return super.quiIni;
  }

  @override
  set quiIni(int value) {
    _$quiIniAtom.reportWrite(value, super.quiIni, () {
      super.quiIni = value;
    });
  }

  final _$quiFimAtom = Atom(name: '_CadastroEspacoControllerBase.quiFim');

  @override
  int get quiFim {
    _$quiFimAtom.reportRead();
    return super.quiFim;
  }

  @override
  set quiFim(int value) {
    _$quiFimAtom.reportWrite(value, super.quiFim, () {
      super.quiFim = value;
    });
  }

  final _$sexIniAtom = Atom(name: '_CadastroEspacoControllerBase.sexIni');

  @override
  int get sexIni {
    _$sexIniAtom.reportRead();
    return super.sexIni;
  }

  @override
  set sexIni(int value) {
    _$sexIniAtom.reportWrite(value, super.sexIni, () {
      super.sexIni = value;
    });
  }

  final _$sexFimAtom = Atom(name: '_CadastroEspacoControllerBase.sexFim');

  @override
  int get sexFim {
    _$sexFimAtom.reportRead();
    return super.sexFim;
  }

  @override
  set sexFim(int value) {
    _$sexFimAtom.reportWrite(value, super.sexFim, () {
      super.sexFim = value;
    });
  }

  final _$sabIniAtom = Atom(name: '_CadastroEspacoControllerBase.sabIni');

  @override
  int get sabIni {
    _$sabIniAtom.reportRead();
    return super.sabIni;
  }

  @override
  set sabIni(int value) {
    _$sabIniAtom.reportWrite(value, super.sabIni, () {
      super.sabIni = value;
    });
  }

  final _$sabFimAtom = Atom(name: '_CadastroEspacoControllerBase.sabFim');

  @override
  int get sabFim {
    _$sabFimAtom.reportRead();
    return super.sabFim;
  }

  @override
  set sabFim(int value) {
    _$sabFimAtom.reportWrite(value, super.sabFim, () {
      super.sabFim = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CadastroEspacoControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_CadastroEspacoControllerBaseActionController =
      ActionController(name: '_CadastroEspacoControllerBase');

  @override
  dynamic statusAutorizacaoResponsavel() {
    final _$actionInfo =
        _$_CadastroEspacoControllerBaseActionController.startAction(
            name: '_CadastroEspacoControllerBase.statusAutorizacaoResponsavel');
    try {
      return super.statusAutorizacaoResponsavel();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusapenasProprietarioReserva() {
    final _$actionInfo =
        _$_CadastroEspacoControllerBaseActionController.startAction(
            name:
                '_CadastroEspacoControllerBase.statusapenasProprietarioReserva');
    try {
      return super.statusapenasProprietarioReserva();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusDom() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusDom');
    try {
      return super.statusDom();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusSeg() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusSeg');
    try {
      return super.statusSeg();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusTer() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusTer');
    try {
      return super.statusTer();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusQua() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusQua');
    try {
      return super.statusQua();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusQui() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusQui');
    try {
      return super.statusQui();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusSex() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusSex');
    try {
      return super.statusSex();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic statusSab() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.statusSab');
    try {
      return super.statusSab();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
horarios: ${horarios},
statusCriacao: ${statusCriacao},
espacoEditar: ${espacoEditar},
tempoMinPermanencia: ${tempoMinPermanencia},
tempoMaxPermanencia: ${tempoMaxPermanencia},
tempoMinAntecedencia: ${tempoMinAntecedencia},
tempoMaxAntecedencia: ${tempoMaxAntecedencia},
tempoIntervaloReserva: ${tempoIntervaloReserva},
ativarDom: ${ativarDom},
ativarSeg: ${ativarSeg},
ativarTer: ${ativarTer},
ativarQua: ${ativarQua},
ativarQui: ${ativarQui},
ativarSex: ${ativarSex},
ativarSab: ${ativarSab},
autorizacaoResponsavel: ${autorizacaoResponsavel},
apenasProprietarioReserva: ${apenasProprietarioReserva},
domIni: ${domIni},
domFim: ${domFim},
segIni: ${segIni},
segFim: ${segFim},
terIni: ${terIni},
terFim: ${terFim},
quaIni: ${quaIni},
quaFim: ${quaFim},
quiIni: ${quiIni},
quiFim: ${quiFim},
sexIni: ${sexIni},
sexFim: ${sexFim},
sabIni: ${sabIni},
sabFim: ${sabFim}
    ''';
  }
}
