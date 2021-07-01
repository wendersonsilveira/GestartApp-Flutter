// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_pet_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroPetController = BindInject(
  (i) => CadastroPetController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroPetController on _CadastroPetControllerBase, Store {
  final _$valueAtom = Atom(name: '_CadastroPetControllerBase.value');

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

  final _$_CadastroPetControllerBaseActionController =
      ActionController(name: '_CadastroPetControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CadastroPetControllerBaseActionController
        .startAction(name: '_CadastroPetControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CadastroPetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
