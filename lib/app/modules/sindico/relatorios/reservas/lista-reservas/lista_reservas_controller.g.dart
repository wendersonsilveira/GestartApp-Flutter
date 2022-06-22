// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_reservas_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListaReservasController = BindInject(
  (i) => ListaReservasController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaReservasController on _ListaReservasControllerBase, Store {
  final _$reservasAtom = Atom(name: '_ListaReservasControllerBase.reservas');

  @override
  ResourceData<List<ReservaEntity>> get reservas {
    _$reservasAtom.reportRead();
    return super.reservas;
  }

  @override
  set reservas(ResourceData<List<ReservaEntity>> value) {
    _$reservasAtom.reportWrite(value, super.reservas, () {
      super.reservas = value;
    });
  }

  final _$getReservasAsyncAction =
      AsyncAction('_ListaReservasControllerBase.getReservas');

  @override
  Future<void> getReservas(dynamic params) {
    return _$getReservasAsyncAction.run(() => super.getReservas(params));
  }

  @override
  String toString() {
    return '''
reservas: ${reservas}
    ''';
  }
}
