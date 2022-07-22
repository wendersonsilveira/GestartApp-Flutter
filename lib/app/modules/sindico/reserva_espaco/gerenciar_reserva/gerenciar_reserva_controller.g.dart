// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gerenciar_reserva_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GerenciarReservaController = BindInject(
  (i) => GerenciarReservaController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GerenciarReservaController on _GerenciarReservaControllerBase, Store {
  final _$valueAtom = Atom(name: '_GerenciarReservaControllerBase.value');

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

  final _$_GerenciarReservaControllerBaseActionController =
      ActionController(name: '_GerenciarReservaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_GerenciarReservaControllerBaseActionController
        .startAction(name: '_GerenciarReservaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_GerenciarReservaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
