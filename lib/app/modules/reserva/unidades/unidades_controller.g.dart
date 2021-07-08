// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidades_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UnidadesController = BindInject(
  (i) => UnidadesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnidadesController on _UnidadesControllerBase, Store {
  final _$valueAtom = Atom(name: '_UnidadesControllerBase.value');

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

  final _$_UnidadesControllerBaseActionController =
      ActionController(name: '_UnidadesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_UnidadesControllerBaseActionController.startAction(
        name: '_UnidadesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_UnidadesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
