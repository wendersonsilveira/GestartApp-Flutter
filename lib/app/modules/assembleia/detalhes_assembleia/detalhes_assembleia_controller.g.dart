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
  final _$editalAtom = Atom(name: '_DetalhesAssembleiaControllerBase.edital');

  @override
  ResourceData<List<EditalEntity>> get edital {
    _$editalAtom.reportRead();
    return super.edital;
  }

  @override
  set edital(ResourceData<List<EditalEntity>> value) {
    _$editalAtom.reportWrite(value, super.edital, () {
      super.edital = value;
    });
  }

  final _$loadingAtom = Atom(name: '_DetalhesAssembleiaControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$initAsyncAction =
      AsyncAction('_DetalhesAssembleiaControllerBase.init');

  @override
  Future init(int id) {
    return _$initAsyncAction.run(() => super.init(id));
  }

  final _$_DetalhesAssembleiaControllerBaseActionController =
      ActionController(name: '_DetalhesAssembleiaControllerBase');

  @override
  void carregado(bool status) {
    final _$actionInfo = _$_DetalhesAssembleiaControllerBaseActionController
        .startAction(name: '_DetalhesAssembleiaControllerBase.carregado');
    try {
      return super.carregado(status);
    } finally {
      _$_DetalhesAssembleiaControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
edital: ${edital},
loading: ${loading}
    ''';
  }
}
