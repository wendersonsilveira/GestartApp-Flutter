// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_boleto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalheBoletoController = BindInject(
  (i) => DetalheBoletoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheBoletoController on _DetalheBoletoControllerBase, Store {
  final _$boletoAtom = Atom(name: '_DetalheBoletoControllerBase.boleto');

  @override
  ResourceData<DetalheBoletoEntity> get boleto {
    _$boletoAtom.reportRead();
    return super.boleto;
  }

  @override
  set boleto(ResourceData<DetalheBoletoEntity> value) {
    _$boletoAtom.reportWrite(value, super.boleto, () {
      super.boleto = value;
    });
  }

  final _$urlConsultaAtom =
      Atom(name: '_DetalheBoletoControllerBase.urlConsulta');

  @override
  ResourceData<String> get urlConsulta {
    _$urlConsultaAtom.reportRead();
    return super.urlConsulta;
  }

  @override
  set urlConsulta(ResourceData<String> value) {
    _$urlConsultaAtom.reportWrite(value, super.urlConsulta, () {
      super.urlConsulta = value;
    });
  }

  final _$valueAtom = Atom(name: '_DetalheBoletoControllerBase.value');

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

  final _$initAsyncAction = AsyncAction('_DetalheBoletoControllerBase.init');

  @override
  Future init({dynamic idBoleto}) {
    return _$initAsyncAction.run(() => super.init(idBoleto: idBoleto));
  }

  final _$buscarLinkParcelamentoAsyncAction =
      AsyncAction('_DetalheBoletoControllerBase.buscarLinkParcelamento');

  @override
  Future<dynamic> buscarLinkParcelamento(String identificador) {
    return _$buscarLinkParcelamentoAsyncAction
        .run(() => super.buscarLinkParcelamento(identificador));
  }

  final _$_DetalheBoletoControllerBaseActionController =
      ActionController(name: '_DetalheBoletoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetalheBoletoControllerBaseActionController
        .startAction(name: '_DetalheBoletoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetalheBoletoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
boleto: ${boleto},
urlConsulta: ${urlConsulta},
value: ${value}
    ''';
  }
}
