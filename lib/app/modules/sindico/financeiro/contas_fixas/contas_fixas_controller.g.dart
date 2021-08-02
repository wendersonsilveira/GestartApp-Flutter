// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contas_fixas_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ContasFixasController = BindInject(
  (i) => ContasFixasController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContasFixasController on _ContasFixasControllerBase, Store {
  final _$contasAtom = Atom(name: '_ContasFixasControllerBase.contas');

  @override
  ResourceData<List<ContasEntity>> get contas {
    _$contasAtom.reportRead();
    return super.contas;
  }

  @override
  set contas(ResourceData<List<ContasEntity>> value) {
    _$contasAtom.reportWrite(value, super.contas, () {
      super.contas = value;
    });
  }

  final _$tiposAtom = Atom(name: '_ContasFixasControllerBase.tipos');

  @override
  List<ContasEntity> get tipos {
    _$tiposAtom.reportRead();
    return super.tipos;
  }

  @override
  set tipos(List<ContasEntity> value) {
    _$tiposAtom.reportWrite(value, super.tipos, () {
      super.tipos = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ContasFixasControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_ContasFixasControllerBaseActionController =
      ActionController(name: '_ContasFixasControllerBase');

  @override
  dynamic inserirTipos() {
    final _$actionInfo = _$_ContasFixasControllerBaseActionController
        .startAction(name: '_ContasFixasControllerBase.inserirTipos');
    try {
      return super.inserirTipos();
    } finally {
      _$_ContasFixasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contas: ${contas},
tipos: ${tipos}
    ''';
  }
}
