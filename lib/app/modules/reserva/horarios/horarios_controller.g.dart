// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horarios_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HorariosController = BindInject(
  (i) => HorariosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HorariosController on _HorariosControllerBase, Store {
  final _$valueAtom = Atom(name: '_HorariosControllerBase.value');

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

  final _$_HorariosControllerBaseActionController =
      ActionController(name: '_HorariosControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_HorariosControllerBaseActionController.startAction(
        name: '_HorariosControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HorariosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
