// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_documentos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ViewDocumentosController = BindInject(
  (i) => ViewDocumentosController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewDocumentosController on _ViewDocumentosControllerBase, Store {
  final _$valueAtom = Atom(name: '_ViewDocumentosControllerBase.value');

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

  final _$_ViewDocumentosControllerBaseActionController =
      ActionController(name: '_ViewDocumentosControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ViewDocumentosControllerBaseActionController
        .startAction(name: '_ViewDocumentosControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ViewDocumentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
