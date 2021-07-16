// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listar_espacos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListarEspacosController = BindInject(
  (i) => ListarEspacosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListarEspacosController on _ListarEspacosControllerBase, Store {
  final _$reservasAtom = Atom(name: '_ListarEspacosControllerBase.reservas');

  @override
  ResourceData<List<EspacoEntity>> get reservas {
    _$reservasAtom.reportRead();
    return super.reservas;
  }

  @override
  set reservas(ResourceData<List<EspacoEntity>> value) {
    _$reservasAtom.reportWrite(value, super.reservas, () {
      super.reservas = value;
    });
  }

  final _$statusExcluirEspacoAtom =
      Atom(name: '_ListarEspacosControllerBase.statusExcluirEspaco');

  @override
  ResourceData<dynamic> get statusExcluirEspaco {
    _$statusExcluirEspacoAtom.reportRead();
    return super.statusExcluirEspaco;
  }

  @override
  set statusExcluirEspaco(ResourceData<dynamic> value) {
    _$statusExcluirEspacoAtom.reportWrite(value, super.statusExcluirEspaco, () {
      super.statusExcluirEspaco = value;
    });
  }

  @override
  String toString() {
    return '''
reservas: ${reservas},
statusExcluirEspaco: ${statusExcluirEspaco}
    ''';
  }
}
