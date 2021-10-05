// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_balancete_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalheBalanceteController = BindInject(
  (i) => DetalheBalanceteController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheBalanceteController on _DetalheBalanceteControllerBase, Store {
  final _$valueAtom = Atom(name: '_DetalheBalanceteControllerBase.value');

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

  final _$_DetalheBalanceteControllerBaseActionController =
      ActionController(name: '_DetalheBalanceteControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetalheBalanceteControllerBaseActionController
        .startAction(name: '_DetalheBalanceteControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetalheBalanceteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
