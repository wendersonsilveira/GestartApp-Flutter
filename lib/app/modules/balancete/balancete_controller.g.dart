// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balancete_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BalanceteController = BindInject(
  (i) => BalanceteController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceteController on _BalanceteControllerBase, Store {
  final _$valueAtom = Atom(name: '_BalanceteControllerBase.value');

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

  final _$_BalanceteControllerBaseActionController =
      ActionController(name: '_BalanceteControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_BalanceteControllerBaseActionController.startAction(
        name: '_BalanceteControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_BalanceteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
