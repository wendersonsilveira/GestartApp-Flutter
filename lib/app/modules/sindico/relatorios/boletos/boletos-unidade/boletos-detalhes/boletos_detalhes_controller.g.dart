// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boletos_detalhes_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BoletosDetalhesController = BindInject(
  (i) => BoletosDetalhesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoletosDetalhesController on _BoletosDetalhesControllerBase, Store {
  final _$boletoAtom = Atom(name: '_BoletosDetalhesControllerBase.boleto');

  @override
  ResourceData<List<DetalheBoletoUnidadeEntity>> get boleto {
    _$boletoAtom.reportRead();
    return super.boleto;
  }

  @override
  set boleto(ResourceData<List<DetalheBoletoUnidadeEntity>> value) {
    _$boletoAtom.reportWrite(value, super.boleto, () {
      super.boleto = value;
    });
  }

  @override
  String toString() {
    return '''
boleto: ${boleto}
    ''';
  }
}
