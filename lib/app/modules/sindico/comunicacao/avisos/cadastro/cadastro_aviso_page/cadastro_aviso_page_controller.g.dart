// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_aviso_page_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroAvisoPageController = BindInject(
  (i) => CadastroAvisoPageController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroAvisoPageController on _CadastroAvisoPageControllerBase, Store {
  final _$valueAtom = Atom(name: '_CadastroAvisoPageControllerBase.value');

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

  final _$_CadastroAvisoPageControllerBaseActionController =
      ActionController(name: '_CadastroAvisoPageControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CadastroAvisoPageControllerBaseActionController
        .startAction(name: '_CadastroAvisoPageControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CadastroAvisoPageControllerBaseActionController
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
