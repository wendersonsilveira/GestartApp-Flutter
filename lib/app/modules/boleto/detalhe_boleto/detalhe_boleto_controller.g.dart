// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_boleto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalheBoletoController = BindInject(
  (i) => DetalheBoletoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheBoletoController on _DetalheBoletoControllerBase, Store {
  final _$valueAtom = Atom(name: '_DetalheBoletoControllerBase.value');

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

  final _$_DetalheBoletoControllerBaseActionController =
      ActionController(name: '_DetalheBoletoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetalheBoletoControllerBaseActionController
        .startAction(name: '_DetalheBoletoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetalheBoletoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
