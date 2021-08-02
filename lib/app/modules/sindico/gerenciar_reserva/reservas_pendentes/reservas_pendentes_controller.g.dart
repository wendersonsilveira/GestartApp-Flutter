// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservas_pendentes_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReservasPendentesController = BindInject(
  (i) => ReservasPendentesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReservasPendentesController on _ReservasPendentesControllerBase, Store {
  final _$reservasAdmAtom =
      Atom(name: '_ReservasPendentesControllerBase.reservasAdm');

  @override
  ResourceData<List<ReservaEntity>> get reservasAdm {
    _$reservasAdmAtom.reportRead();
    return super.reservasAdm;
  }

  @override
  set reservasAdm(ResourceData<List<ReservaEntity>> value) {
    _$reservasAdmAtom.reportWrite(value, super.reservasAdm, () {
      super.reservasAdm = value;
    });
  }

  final _$reservasPendentesAtom =
      Atom(name: '_ReservasPendentesControllerBase.reservasPendentes');

  @override
  List<ReservaEntity> get reservasPendentes {
    _$reservasPendentesAtom.reportRead();
    return super.reservasPendentes;
  }

  @override
  set reservasPendentes(List<ReservaEntity> value) {
    _$reservasPendentesAtom.reportWrite(value, super.reservasPendentes, () {
      super.reservasPendentes = value;
    });
  }

  final _$statusAprovarAtom =
      Atom(name: '_ReservasPendentesControllerBase.statusAprovar');

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
      Atom(name: '_ReservasPendentesControllerBase.statusRejeitar');

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

  final _$initAsyncAction =
      AsyncAction('_ReservasPendentesControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$aprovarReservaAsyncAction =
      AsyncAction('_ReservasPendentesControllerBase.aprovarReserva');

  @override
  Future<ResourceData<dynamic>> aprovarReserva(int reservaId) {
    return _$aprovarReservaAsyncAction
        .run(() => super.aprovarReserva(reservaId));
  }

  final _$rejeitarReservaAsyncAction =
      AsyncAction('_ReservasPendentesControllerBase.rejeitarReserva');

  @override
  Future<ResourceData<dynamic>> rejeitarReserva(int reservaId) {
    return _$rejeitarReservaAsyncAction
        .run(() => super.rejeitarReserva(reservaId));
  }

  final _$_ReservasPendentesControllerBaseActionController =
      ActionController(name: '_ReservasPendentesControllerBase');

  @override
  dynamic inserirReservasPendentes() {
    final _$actionInfo =
        _$_ReservasPendentesControllerBaseActionController.startAction(
            name: '_ReservasPendentesControllerBase.inserirReservasPendentes');
    try {
      return super.inserirReservasPendentes();
    } finally {
      _$_ReservasPendentesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reservasAdm: ${reservasAdm},
reservasPendentes: ${reservasPendentes},
statusAprovar: ${statusAprovar},
statusRejeitar: ${statusRejeitar}
    ''';
  }
}
