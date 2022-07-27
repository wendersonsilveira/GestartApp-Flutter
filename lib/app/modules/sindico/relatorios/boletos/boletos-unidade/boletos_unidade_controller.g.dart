// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boletos_unidade_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BoletosUnidadeController = BindInject(
  (i) => BoletosUnidadeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoletosUnidadeController on _BoletosUnidadeControllerBase, Store {
  final _$boletosAtom = Atom(name: '_BoletosUnidadeControllerBase.boletos');

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

  final _$getBoletosAsyncAction =
      AsyncAction('_BoletosUnidadeControllerBase.getBoletos');

  @override
  Future<void> getBoletos(int params) {
    return _$getBoletosAsyncAction.run(() => super.getBoletos(params));
  }

  @override
  String toString() {
    return '''
boletos: ${boletos}
    ''';
  }
}
