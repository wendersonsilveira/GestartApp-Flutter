// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $VeiculosController = BindInject(
  (i) => VeiculosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VeiculosController on _VeiculosControllerBase, Store {
  final _$veiculosAtom = Atom(name: '_VeiculosControllerBase.veiculos');

  @override
  ResourceData<List<VeiculoEntity>> get veiculos {
    _$veiculosAtom.reportRead();
    return super.veiculos;
  }

  @override
  set veiculos(ResourceData<List<VeiculoEntity>> value) {
    _$veiculosAtom.reportWrite(value, super.veiculos, () {
      super.veiculos = value;
    });
  }

  final _$getVeiculosAsyncAction =
      AsyncAction('_VeiculosControllerBase.getVeiculos');

  @override
  Future getVeiculos() {
    return _$getVeiculosAsyncAction.run(() => super.getVeiculos());
  }

  final _$deleteVeiculoAsyncAction =
      AsyncAction('_VeiculosControllerBase.deleteVeiculo');

  @override
  Future<dynamic> deleteVeiculo(int id) {
    return _$deleteVeiculoAsyncAction.run(() => super.deleteVeiculo(id));
  }

  final _$_VeiculosControllerBaseActionController =
      ActionController(name: '_VeiculosControllerBase');

  @override
  dynamic removeVeiculo(int index) {
    final _$actionInfo = _$_VeiculosControllerBaseActionController.startAction(
        name: '_VeiculosControllerBase.removeVeiculo');
    try {
      return super.removeVeiculo(index);
    } finally {
      _$_VeiculosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
veiculos: ${veiculos}
    ''';
  }
}
