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

  final _$resAtom = Atom(name: '_DetalhesReservaControllerBase.res');

  @override
  ResourceData<ReservaEntity> get res {
    _$resAtom.reportRead();
    return super.res;
  }

  @override
  set res(ResourceData<ReservaEntity> value) {
    _$resAtom.reportWrite(value, super.res, () {
      super.res = value;
    });
  }

  final _$isButtondisabledAtom =
      Atom(name: '_DetalhesReservaControllerBase.isButtondisabled');

  @override
  bool get isButtondisabled {
    _$isButtondisabledAtom.reportRead();
    return super.isButtondisabled;
  }

  @override
  set isButtondisabled(bool value) {
    _$isButtondisabledAtom.reportWrite(value, super.isButtondisabled, () {
      super.isButtondisabled = value;
    });
  }

  final _$dataUtilAtom = Atom(name: '_DetalhesReservaControllerBase.dataUtil');

  @override
  DateTime get dataUtil {
    _$dataUtilAtom.reportRead();
    return super.dataUtil;
  }

  @override
  set dataUtil(DateTime value) {
    _$dataUtilAtom.reportWrite(value, super.dataUtil, () {
      super.dataUtil = value;
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

  final _$getDateAsyncAction =
      AsyncAction('_DetalhesReservaControllerBase.getDate');

  @override
  Future getDate(int idReserva) {
    return _$getDateAsyncAction.run(() => super.getDate(idReserva));
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
res: ${res},
isButtondisabled: ${isButtondisabled},
dataUtil: ${dataUtil},
statusAprovar: ${statusAprovar},
statusRejeitar: ${statusRejeitar}
    ''';
  }
}
