// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_veiculo_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroVeiculoController = BindInject(
  (i) => CadastroVeiculoController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroVeiculoController on _CadastroVeiculoControllerBase, Store {
  final _$veiculoAtom = Atom(name: '_CadastroVeiculoControllerBase.veiculo');

  @override
  ResourceData<VeiculoEntity> get veiculo {
    _$veiculoAtom.reportRead();
    return super.veiculo;
  }

  @override
  set veiculo(ResourceData<VeiculoEntity> value) {
    _$veiculoAtom.reportWrite(value, super.veiculo, () {
      super.veiculo = value;
    });
  }

  final _$loadingVeiculoAtom =
      Atom(name: '_CadastroVeiculoControllerBase.loadingVeiculo');

  @override
  ResourceData<dynamic> get loadingVeiculo {
    _$loadingVeiculoAtom.reportRead();
    return super.loadingVeiculo;
  }

  @override
  set loadingVeiculo(ResourceData<dynamic> value) {
    _$loadingVeiculoAtom.reportWrite(value, super.loadingVeiculo, () {
      super.loadingVeiculo = value;
    });
  }

  final _$loadingFormAtom =
      Atom(name: '_CadastroVeiculoControllerBase.loadingForm');

  @override
  bool get loadingForm {
    _$loadingFormAtom.reportRead();
    return super.loadingForm;
  }

  @override
  set loadingForm(bool value) {
    _$loadingFormAtom.reportWrite(value, super.loadingForm, () {
      super.loadingForm = value;
    });
  }

  final _$createVeiculoAsyncAction =
      AsyncAction('_CadastroVeiculoControllerBase.createVeiculo');

  @override
  Future<ResourceData<dynamic>> createVeiculo(VeiculoEntity veiculo) {
    return _$createVeiculoAsyncAction.run(() => super.createVeiculo(veiculo));
  }

  final _$getVeiculoAsyncAction =
      AsyncAction('_CadastroVeiculoControllerBase.getVeiculo');

  @override
  Future<VeiculoEntity> getVeiculo(int id) {
    return _$getVeiculoAsyncAction.run(() => super.getVeiculo(id));
  }

  final _$_CadastroVeiculoControllerBaseActionController =
      ActionController(name: '_CadastroVeiculoControllerBase');

  @override
  void alteraLoading(bool value) {
    final _$actionInfo = _$_CadastroVeiculoControllerBaseActionController
        .startAction(name: '_CadastroVeiculoControllerBase.alteraLoading');
    try {
      return super.alteraLoading(value);
    } finally {
      _$_CadastroVeiculoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
veiculo: ${veiculo},
loadingVeiculo: ${loadingVeiculo},
loadingForm: ${loadingForm}
    ''';
  }
}
