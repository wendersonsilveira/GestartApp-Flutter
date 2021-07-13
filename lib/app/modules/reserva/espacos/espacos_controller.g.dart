// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'espacos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EspacosController = BindInject(
  (i) => EspacosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EspacosController on _EspacosControllerBase, Store {
  final _$valueAtom = Atom(name: '_EspacosControllerBase.value');

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

  final _$_EspacosControllerBaseActionController =
      ActionController(name: '_EspacosControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_EspacosControllerBaseActionController.startAction(
        name: '_EspacosControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EspacosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
