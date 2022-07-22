// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documentos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DocumentosController = BindInject(
  (i) => DocumentosController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DocumentosController on _DocumentosControllerBase, Store {
  final _$downloadProgressAtom =
      Atom(name: '_DocumentosControllerBase.downloadProgress');

  @override
  int get downloadProgress {
    _$downloadProgressAtom.reportRead();
    return super.downloadProgress;
  }

  @override
  set downloadProgress(int value) {
    _$downloadProgressAtom.reportWrite(value, super.downloadProgress, () {
      super.downloadProgress = value;
    });
  }

  final _$documentosAtom = Atom(name: '_DocumentosControllerBase.documentos');

  @override
  ResourceData<List<DocumentoEntity>> get documentos {
    _$documentosAtom.reportRead();
    return super.documentos;
  }

  @override
  set documentos(ResourceData<List<DocumentoEntity>> value) {
    _$documentosAtom.reportWrite(value, super.documentos, () {
      super.documentos = value;
    });
  }

  final _$codConAtom = Atom(name: '_DocumentosControllerBase.codCon');

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

  final _$condominiosAtom = Atom(name: '_DocumentosControllerBase.condominios');

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

  final _$listaViewAtom = Atom(name: '_DocumentosControllerBase.listaView');

  @override
  List<DocumentoEntity> get listaView {
    _$listaViewAtom.reportRead();
    return super.listaView;
  }

  @override
  set listaView(List<DocumentoEntity> value) {
    _$listaViewAtom.reportWrite(value, super.listaView, () {
      super.listaView = value;
    });
  }

  final _$_DocumentosControllerBaseActionController =
      ActionController(name: '_DocumentosControllerBase');

  @override
  dynamic changeDropdown(int codCond) {
    final _$actionInfo = _$_DocumentosControllerBaseActionController
        .startAction(name: '_DocumentosControllerBase.changeDropdown');
    try {
      return super.changeDropdown(codCond);
    } finally {
      _$_DocumentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProgressStatus(int received, int total) {
    final _$actionInfo = _$_DocumentosControllerBaseActionController
        .startAction(name: '_DocumentosControllerBase.setProgressStatus');
    try {
      return super.setProgressStatus(received, total);
    } finally {
      _$_DocumentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetProgress() {
    final _$actionInfo = _$_DocumentosControllerBaseActionController
        .startAction(name: '_DocumentosControllerBase.resetProgress');
    try {
      return super.resetProgress();
    } finally {
      _$_DocumentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
downloadProgress: ${downloadProgress},
documentos: ${documentos},
codCon: ${codCon},
condominios: ${condominios},
listaView: ${listaView}
    ''';
  }
}
