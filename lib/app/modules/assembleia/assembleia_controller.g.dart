// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assembleia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AssembleiaController = BindInject(
  (i) => AssembleiaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssembleiaController on _AssembleiaControllerBase, Store {
  final _$valueAtom = Atom(name: '_AssembleiaControllerBase.value');

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

  final _$_AssembleiaControllerBaseActionController =
      ActionController(name: '_AssembleiaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_AssembleiaControllerBaseActionController
        .startAction(name: '_AssembleiaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_AssembleiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
