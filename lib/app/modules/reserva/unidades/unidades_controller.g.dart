// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidades_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UnidadesController = BindInject(
  (i) => UnidadesController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnidadesController on _UnidadesControllerBase, Store {
  final _$unidadesAtom = Atom(name: '_UnidadesControllerBase.unidades');

  @override
  List<UnidadeEntity> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(List<UnidadeEntity> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  @override
  String toString() {
    return '''
unidades: ${unidades}
    ''';
  }
}
