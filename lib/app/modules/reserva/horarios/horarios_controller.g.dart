// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horarios_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HorariosController = BindInject(
  (i) => HorariosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HorariosController on _HorariosControllerBase, Store {
  final _$horariosAtom = Atom(name: '_HorariosControllerBase.horarios');

  @override
  List<HorarioEspacoEntity> get horarios {
    _$horariosAtom.reportRead();
    return super.horarios;
  }

  @override
  set horarios(List<HorarioEspacoEntity> value) {
    _$horariosAtom.reportWrite(value, super.horarios, () {
      super.horarios = value;
    });
  }

  final _$espacoAtom = Atom(name: '_HorariosControllerBase.espaco');

  @override
  EspacoEntity get espaco {
    _$espacoAtom.reportRead();
    return super.espaco;
  }

  @override
  set espaco(EspacoEntity value) {
    _$espacoAtom.reportWrite(value, super.espaco, () {
      super.espaco = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HorariosControllerBase.isLoading');

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

  final _$horaInAtom = Atom(name: '_HorariosControllerBase.horaIn');

  @override
  String get horaIn {
    _$horaInAtom.reportRead();
    return super.horaIn;
  }

  @override
  set horaIn(String value) {
    _$horaInAtom.reportWrite(value, super.horaIn, () {
      super.horaIn = value;
    });
  }

  final _$horaFiAtom = Atom(name: '_HorariosControllerBase.horaFi');

  @override
  String get horaFi {
    _$horaFiAtom.reportRead();
    return super.horaFi;
  }

  @override
  set horaFi(String value) {
    _$horaFiAtom.reportWrite(value, super.horaFi, () {
      super.horaFi = value;
    });
  }

  final _$horariosDisponiveisAtom =
      Atom(name: '_HorariosControllerBase.horariosDisponiveis');

  @override
  List<String> get horariosDisponiveis {
    _$horariosDisponiveisAtom.reportRead();
    return super.horariosDisponiveis;
  }

  @override
  set horariosDisponiveis(List<String> value) {
    _$horariosDisponiveisAtom.reportWrite(value, super.horariosDisponiveis, () {
      super.horariosDisponiveis = value;
    });
  }

  final _$horariosFinalAtom =
      Atom(name: '_HorariosControllerBase.horariosFinal');

  @override
  List<String> get horariosFinal {
    _$horariosFinalAtom.reportRead();
    return super.horariosFinal;
  }

  @override
  set horariosFinal(List<String> value) {
    _$horariosFinalAtom.reportWrite(value, super.horariosFinal, () {
      super.horariosFinal = value;
    });
  }

  final _$getHorariosEspacoAsyncAction =
      AsyncAction('_HorariosControllerBase.getHorariosEspaco');

  @override
  Future getHorariosEspaco(DateTime data) {
    return _$getHorariosEspacoAsyncAction
        .run(() => super.getHorariosEspaco(data));
  }

  final _$getEspacoAsyncAction =
      AsyncAction('_HorariosControllerBase.getEspaco');

  @override
  Future getEspaco(int espacoId) {
    return _$getEspacoAsyncAction.run(() => super.getEspaco(espacoId));
  }

  final _$_HorariosControllerBaseActionController =
      ActionController(name: '_HorariosControllerBase');

  @override
  dynamic setHorarioIn(String hIni) {
    final _$actionInfo = _$_HorariosControllerBaseActionController.startAction(
        name: '_HorariosControllerBase.setHorarioIn');
    try {
      return super.setHorarioIn(hIni);
    } finally {
      _$_HorariosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHorarioFi(String hFim) {
    final _$actionInfo = _$_HorariosControllerBaseActionController.startAction(
        name: '_HorariosControllerBase.setHorarioFi');
    try {
      return super.setHorarioFi(hFim);
    } finally {
      _$_HorariosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checarPermanencia() {
    final _$actionInfo = _$_HorariosControllerBaseActionController.startAction(
        name: '_HorariosControllerBase.checarPermanencia');
    try {
      return super.checarPermanencia();
    } finally {
      _$_HorariosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic criarHorariosDisponiveis(dynamic h) {
    final _$actionInfo = _$_HorariosControllerBaseActionController.startAction(
        name: '_HorariosControllerBase.criarHorariosDisponiveis');
    try {
      return super.criarHorariosDisponiveis(h);
    } finally {
      _$_HorariosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHorariosFinal() {
    final _$actionInfo = _$_HorariosControllerBaseActionController.startAction(
        name: '_HorariosControllerBase.setHorariosFinal');
    try {
      return super.setHorariosFinal();
    } finally {
      _$_HorariosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
horarios: ${horarios},
espaco: ${espaco},
isLoading: ${isLoading},
horaIn: ${horaIn},
horaFi: ${horaFi},
horariosDisponiveis: ${horariosDisponiveis},
horariosFinal: ${horariosFinal}
    ''';
  }
}
