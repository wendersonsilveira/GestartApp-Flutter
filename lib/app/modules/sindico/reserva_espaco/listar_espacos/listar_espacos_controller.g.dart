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
  final _$espacosAtom = Atom(name: '_ListarEspacosControllerBase.espacos');

  @override
  ResourceData<List<EspacoEntity>> get espacos {
    _$espacosAtom.reportRead();
    return super.espacos;
  }

  @override
  set espacos(ResourceData<List<EspacoEntity>> value) {
    _$espacosAtom.reportWrite(value, super.espacos, () {
      super.espacos = value;
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

  final _$valueAtom = Atom(name: '_ListarEspacosControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  @override
  String toString() {
    return '''
espacos: ${espacos},
statusExcluirEspaco: ${statusExcluirEspaco},
value: ${value}
    ''';
  }
}
