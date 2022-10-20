// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segunda_via_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SegundaViaController = BindInject(
  (i) => SegundaViaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SegundaViaController on _SegundaViaControllerBase, Store {
  final _$listaViewAtom = Atom(name: '_SegundaViaControllerBase.listaView');

  @override
  List<BoletoEntity> get listaView {
    _$listaViewAtom.reportRead();
    return super.listaView;
  }

  @override
  set listaView(List<BoletoEntity> value) {
    _$listaViewAtom.reportWrite(value, super.listaView, () {
      super.listaView = value;
    });
  }

  final _$statusAtom = Atom(name: '_SegundaViaControllerBase.status');

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$boletosAtom = Atom(name: '_SegundaViaControllerBase.boletos');

  @override
  ResourceData<List<BoletoEntity>> get boletos {
    _$boletosAtom.reportRead();
    return super.boletos;
  }

  @override
  set boletos(ResourceData<List<BoletoEntity>> value) {
    _$boletosAtom.reportWrite(value, super.boletos, () {
      super.boletos = value;
    });
  }

  final _$codOrdAtom = Atom(name: '_SegundaViaControllerBase.codOrd');

  @override
  int get codOrd {
    _$codOrdAtom.reportRead();
    return super.codOrd;
  }

  @override
  set codOrd(int value) {
    _$codOrdAtom.reportWrite(value, super.codOrd, () {
      super.codOrd = value;
    });
  }

  final _$unidadeSelecionadaAtom =
      Atom(name: '_SegundaViaControllerBase.unidadeSelecionada');

  @override
  bool get unidadeSelecionada {
    _$unidadeSelecionadaAtom.reportRead();
    return super.unidadeSelecionada;
  }

  @override
  set unidadeSelecionada(bool value) {
    _$unidadeSelecionadaAtom.reportWrite(value, super.unidadeSelecionada, () {
      super.unidadeSelecionada = value;
    });
  }

  final _$unidadesAtom = Atom(name: '_SegundaViaControllerBase.unidades');

  @override
  ResourceData<List<UnidadeEntity>> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(ResourceData<List<UnidadeEntity>> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$checkedAtom = Atom(name: '_SegundaViaControllerBase.checked');

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  final _$getBoletosAsyncAction =
      AsyncAction('_SegundaViaControllerBase.getBoletos');

  @override
  Future<void> getBoletos(int codOrd) {
    return _$getBoletosAsyncAction.run(() => super.getBoletos(codOrd));
  }

  final _$getUnidadesAsyncAction =
      AsyncAction('_SegundaViaControllerBase.getUnidades');

  @override
  Future<void> getUnidades(String cpfCnpj) {
    return _$getUnidadesAsyncAction.run(() => super.getUnidades(cpfCnpj));
  }

  final _$getBoletoDetalhesAsyncAction =
      AsyncAction('_SegundaViaControllerBase.getBoletoDetalhes');

  @override
  Future<void> getBoletoDetalhes(String conts) {
    return _$getBoletoDetalhesAsyncAction
        .run(() => super.getBoletoDetalhes(conts));
  }

  final _$_SegundaViaControllerBaseActionController =
      ActionController(name: '_SegundaViaControllerBase');

  @override
  dynamic changeDropdown(int codOrd) {
    final _$actionInfo = _$_SegundaViaControllerBaseActionController
        .startAction(name: '_SegundaViaControllerBase.changeDropdown');
    try {
      return super.changeDropdown(codOrd);
    } finally {
      _$_SegundaViaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaView: ${listaView},
status: ${status},
boletos: ${boletos},
codOrd: ${codOrd},
unidadeSelecionada: ${unidadeSelecionada},
unidades: ${unidades},
checked: ${checked}
    ''';
  }
}
