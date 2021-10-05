// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_reserva_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalhesReservaController = BindInject(
  (i) => DetalhesReservaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesReservaController on _DetalhesReservaControllerBase, Store {
  final _$reservaAtom = Atom(name: '_DetalhesReservaControllerBase.reserva');

  @override
  ResourceData<ReservaEntity> get reserva {
    _$reservaAtom.reportRead();
    return super.reserva;
  }

  @override
  set reserva(ResourceData<ReservaEntity> value) {
    _$reservaAtom.reportWrite(value, super.reserva, () {
      super.reserva = value;
    });
  }

  final _$statusAprovarAtom =
      Atom(name: '_DetalhesReservaControllerBase.statusAprovar');

  @override
  ResourceData<dynamic> get statusAprovar {
    _$statusAprovarAtom.reportRead();
    return super.statusAprovar;
  }

  @override
  set statusAprovar(ResourceData<dynamic> value) {
    _$statusAprovarAtom.reportWrite(value, super.statusAprovar, () {
      super.statusAprovar = value;
    });
  }

  final _$statusRejeitarAtom =
      Atom(name: '_DetalhesReservaControllerBase.statusRejeitar');

  @override
  ResourceData<dynamic> get statusRejeitar {
    _$statusRejeitarAtom.reportRead();
    return super.statusRejeitar;
  }

  @override
  set statusRejeitar(ResourceData<dynamic> value) {
    _$statusRejeitarAtom.reportWrite(value, super.statusRejeitar, () {
      super.statusRejeitar = value;
    });
  }

  final _$aprovarReservaAsyncAction =
      AsyncAction('_DetalhesReservaControllerBase.aprovarReserva');

  @override
  Future<ResourceData<dynamic>> aprovarReserva(int reservaId) {
    return _$aprovarReservaAsyncAction
        .run(() => super.aprovarReserva(reservaId));
  }

  final _$rejeitarReservaAsyncAction =
      AsyncAction('_DetalhesReservaControllerBase.rejeitarReserva');

  @override
  Future<ResourceData<dynamic>> rejeitarReserva(int reservaId) {
    return _$rejeitarReservaAsyncAction
        .run(() => super.rejeitarReserva(reservaId));
  }

  @override
  String toString() {
    return '''
reserva: ${reserva},
statusAprovar: ${statusAprovar},
statusRejeitar: ${statusRejeitar}
    ''';
  }
}
