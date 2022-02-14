// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ativar_condominio_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AtivarCondominioController = BindInject(
  (i) => AtivarCondominioController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtivarCondominioController on _AtivarCondominioControllerBase, Store {
  final _$valueAtom = Atom(name: '_AtivarCondominioControllerBase.value');

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

  final _$_AtivarCondominioControllerBaseActionController =
      ActionController(name: '_AtivarCondominioControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_AtivarCondominioControllerBaseActionController
        .startAction(name: '_AtivarCondominioControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_AtivarCondominioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
