// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserva_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReservaController = BindInject(
  (i) => ReservaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReservaController on _ReservaControllerBase, Store {
  final _$reservasAtom = Atom(name: '_ReservaControllerBase.reservas');

  @override
  List<ReservaEntity> get reservas {
    _$reservasAtom.reportRead();
    return super.reservas;
  }

  @override
  set reservas(List<ReservaEntity> value) {
    _$reservasAtom.reportWrite(value, super.reservas, () {
      super.reservas = value;
    });
  }

  final _$getReservasAsyncAction =
      AsyncAction('_ReservaControllerBase.getReservas');

  @override
  Future getReservas() {
    return _$getReservasAsyncAction.run(() => super.getReservas());
  }

  final _$_ReservaControllerBaseActionController =
      ActionController(name: '_ReservaControllerBase');

  @override
  Future<ResourceData<dynamic>> cancelarReserva(int id) {
    final _$actionInfo = _$_ReservaControllerBaseActionController.startAction(
        name: '_ReservaControllerBase.cancelarReserva');
    try {
      return super.cancelarReserva(id);
    } finally {
      _$_ReservaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reservas: ${reservas}
    ''';
  }
}
