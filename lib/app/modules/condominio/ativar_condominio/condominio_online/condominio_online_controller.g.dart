// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condominio_online_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CondominioOnlineController = BindInject(
  (i) => CondominioOnlineController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CondominioOnlineController on _CondominioOnlineControllerBase, Store {
  final _$valueAtom = Atom(name: '_CondominioOnlineControllerBase.value');

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

  final _$_CondominioOnlineControllerBaseActionController =
      ActionController(name: '_CondominioOnlineControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CondominioOnlineControllerBaseActionController
        .startAction(name: '_CondominioOnlineControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CondominioOnlineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
