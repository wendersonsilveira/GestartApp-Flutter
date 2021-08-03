// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_reserva_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalhesReservaController = BindInject(
  (i) => DetalhesReservaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesReservaController on _DetalhesReservaControllerBase, Store {
  final _$valueAtom = Atom(name: '_DetalhesReservaControllerBase.value');

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

  final _$_DetalhesReservaControllerBaseActionController =
      ActionController(name: '_DetalhesReservaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetalhesReservaControllerBaseActionController
        .startAction(name: '_DetalhesReservaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetalhesReservaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
