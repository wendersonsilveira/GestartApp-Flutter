// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_espaco_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroEspacoController = BindInject(
  (i) => CadastroEspacoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroEspacoController on _CadastroEspacoControllerBase, Store {
  final _$valueAtom = Atom(name: '_CadastroEspacoControllerBase.value');

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

  final _$_CadastroEspacoControllerBaseActionController =
      ActionController(name: '_CadastroEspacoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CadastroEspacoControllerBaseActionController
        .startAction(name: '_CadastroEspacoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CadastroEspacoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
