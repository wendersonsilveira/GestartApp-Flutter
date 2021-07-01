// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_assembleia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalhesAssembleiaController = BindInject(
  (i) => DetalhesAssembleiaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesAssembleiaController
    on _DetalhesAssembleiaControllerBase, Store {
  final _$valueAtom = Atom(name: '_DetalhesAssembleiaControllerBase.value');

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

  final _$_DetalhesAssembleiaControllerBaseActionController =
      ActionController(name: '_DetalhesAssembleiaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetalhesAssembleiaControllerBaseActionController
        .startAction(name: '_DetalhesAssembleiaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetalhesAssembleiaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
