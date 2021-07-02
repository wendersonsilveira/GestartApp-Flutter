// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PetsController = BindInject(
  (i) => PetsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetsController on _PetsControllerBase, Store {
  final _$valueAtom = Atom(name: '_PetsControllerBase.value');

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

  final _$_PetsControllerBaseActionController =
      ActionController(name: '_PetsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_PetsControllerBaseActionController.startAction(
        name: '_PetsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PetsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
