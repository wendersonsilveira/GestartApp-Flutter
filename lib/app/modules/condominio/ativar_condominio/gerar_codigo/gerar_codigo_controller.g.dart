// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gerar_codigo_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GerarCodigoController = BindInject(
  (i) => GerarCodigoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GerarCodigoController on _GerarCodigoControllerBase, Store {
  final _$valueAtom = Atom(name: '_GerarCodigoControllerBase.value');

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

  final _$_GerarCodigoControllerBaseActionController =
      ActionController(name: '_GerarCodigoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_GerarCodigoControllerBaseActionController
        .startAction(name: '_GerarCodigoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_GerarCodigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
