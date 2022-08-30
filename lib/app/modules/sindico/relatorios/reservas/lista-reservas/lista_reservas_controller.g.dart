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
  final _$codConAtom = Atom(name: '_ListaReservasControllerBase.codCon');

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

  final _$reservasPDFAtom =
      Atom(name: '_ListaReservasControllerBase.reservasPDF');

  @override
  ResourceData<List<ReservaEntity>> get reservasPDF {
    _$reservasPDFAtom.reportRead();
    return super.reservasPDF;
  }

  @override
  set reservasPDF(ResourceData<List<ReservaEntity>> value) {
    _$reservasPDFAtom.reportWrite(value, super.reservasPDF, () {
      super.reservasPDF = value;
    });
  }

  final _$perfilAtom = Atom(name: '_ListaReservasControllerBase.perfil');

  @override
  ResourceData<UserEntity> get perfil {
    _$perfilAtom.reportRead();
    return super.perfil;
  }

  @override
  set perfil(ResourceData<UserEntity> value) {
    _$perfilAtom.reportWrite(value, super.perfil, () {
      super.perfil = value;
    });
  }

  final _$getReservasAsyncAction =
      AsyncAction('_ListaReservasControllerBase.getReservas');

  @override
  Future<void> getReservas(dynamic params) {
    return _$getReservasAsyncAction.run(() => super.getReservas(params));
  }

  final _$getPerfilAsyncAction =
      AsyncAction('_ListaReservasControllerBase.getPerfil');

  @override
  Future<void> getPerfil() {
    return _$getPerfilAsyncAction.run(() => super.getPerfil());
  }

  @override
  String toString() {
    return '''
codCon: ${codCon},
reservas: ${reservas},
reservasPDF: ${reservasPDF},
perfil: ${perfil}
    ''';
  }
}
