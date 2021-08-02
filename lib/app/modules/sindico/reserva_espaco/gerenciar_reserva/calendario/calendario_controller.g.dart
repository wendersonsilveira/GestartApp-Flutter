// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CalendarioController = BindInject(
  (i) => CalendarioController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarioController on _CalendarioControllerBase, Store {
  final _$reservasAdmAtom = Atom(name: '_CalendarioControllerBase.reservasAdm');

  @override
  List<ReservaEntity> get reservasAdm {
    _$reservasAdmAtom.reportRead();
    return super.reservasAdm;
  }

  @override
  set reservasAdm(List<ReservaEntity> value) {
    _$reservasAdmAtom.reportWrite(value, super.reservasAdm, () {
      super.reservasAdm = value;
    });
  }

  final _$eventosAtom = Atom(name: '_CalendarioControllerBase.eventos');

  @override
  Map<DateTime, List<DateTime>> get eventos {
    _$eventosAtom.reportRead();
    return super.eventos;
  }

  @override
  set eventos(Map<DateTime, List<DateTime>> value) {
    _$eventosAtom.reportWrite(value, super.eventos, () {
      super.eventos = value;
    });
  }

  final _$reservaAdmDiaAtom =
      Atom(name: '_CalendarioControllerBase.reservaAdmDia');

  @override
  List<ReservaEntity> get reservaAdmDia {
    _$reservaAdmDiaAtom.reportRead();
    return super.reservaAdmDia;
  }

  @override
  set reservaAdmDia(List<ReservaEntity> value) {
    _$reservaAdmDiaAtom.reportWrite(value, super.reservaAdmDia, () {
      super.reservaAdmDia = value;
    });
  }

  final _$rAtom = Atom(name: '_CalendarioControllerBase.r');

  @override
  ResourceData<dynamic> get r {
    _$rAtom.reportRead();
    return super.r;
  }

  @override
  set r(ResourceData<dynamic> value) {
    _$rAtom.reportWrite(value, super.r, () {
      super.r = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_CalendarioControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_CalendarioControllerBaseActionController =
      ActionController(name: '_CalendarioControllerBase');

  @override
  dynamic inserirReservasDia(DateTime date) {
    final _$actionInfo = _$_CalendarioControllerBaseActionController
        .startAction(name: '_CalendarioControllerBase.inserirReservasDia');
    try {
      return super.inserirReservasDia(date);
    } finally {
      _$_CalendarioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reservasAdm: ${reservasAdm},
eventos: ${eventos},
reservaAdmDia: ${reservaAdmDia},
r: ${r}
    ''';
  }
}
