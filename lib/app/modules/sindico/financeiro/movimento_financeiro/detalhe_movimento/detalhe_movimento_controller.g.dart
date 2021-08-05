// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_movimento_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalheMovimentoController = BindInject(
  (i) => DetalheMovimentoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheMovimentoController on _DetalheMovimentoControllerBase, Store {
  final _$valueAtom = Atom(name: '_DetalheMovimentoControllerBase.value');

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

  final _$_DetalheMovimentoControllerBaseActionController =
      ActionController(name: '_DetalheMovimentoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetalheMovimentoControllerBaseActionController
        .startAction(name: '_DetalheMovimentoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetalheMovimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
