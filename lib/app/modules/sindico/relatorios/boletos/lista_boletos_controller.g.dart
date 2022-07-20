// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_boletos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListaBoletosController = BindInject(
  (i) => ListaBoletosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaBoletosController on _ListaBoletosControllerBase, Store {
  final _$boletosAtom = Atom(name: '_ListaBoletosControllerBase.boletos');

  @override
  ResourceData<List<BoletoEntity>> get boletos {
    _$boletosAtom.reportRead();
    return super.boletos;
  }

  @override
  set boletos(ResourceData<List<BoletoEntity>> value) {
    _$boletosAtom.reportWrite(value, super.boletos, () {
      super.boletos = value;
    });
  }

  final _$unidadesAtom = Atom(name: '_ListaBoletosControllerBase.unidades');

  @override
  ResourceData<List<UnidadeEntity>> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(ResourceData<List<UnidadeEntity>> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$filteredUnidadesAtom =
      Atom(name: '_ListaBoletosControllerBase.filteredUnidades');

  @override
  List<UnidadeEntity> get filteredUnidades {
    _$filteredUnidadesAtom.reportRead();
    return super.filteredUnidades;
  }

  @override
  set filteredUnidades(List<UnidadeEntity> value) {
    _$filteredUnidadesAtom.reportWrite(value, super.filteredUnidades, () {
      super.filteredUnidades = value;
    });
  }

  final _$getUnidadesAsyncAction =
      AsyncAction('_ListaBoletosControllerBase.getUnidades');

  @override
  Future<void> getUnidades() {
    return _$getUnidadesAsyncAction.run(() => super.getUnidades());
  }

  final _$getBoletosAsyncAction =
      AsyncAction('_ListaBoletosControllerBase.getBoletos');

  @override
  Future<void> getBoletos(dynamic codord) {
    return _$getBoletosAsyncAction.run(() => super.getBoletos(codord));
  }

  @override
  String toString() {
    return '''
boletos: ${boletos},
unidades: ${unidades},
filteredUnidades: ${filteredUnidades}
    ''';
  }
}
