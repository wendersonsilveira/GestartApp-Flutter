// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codigo_ativacao_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CodigoAtivacaoController = BindInject(
  (i) => CodigoAtivacaoController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CodigoAtivacaoController on _CodigoAtivacaoControllerBase, Store {
  final _$ativacaoAtom = Atom(name: '_CodigoAtivacaoControllerBase.ativacao');

  @override
  ResourceData<dynamic> get ativacao {
    _$ativacaoAtom.reportRead();
    return super.ativacao;
  }

  @override
  set ativacao(ResourceData<dynamic> value) {
    _$ativacaoAtom.reportWrite(value, super.ativacao, () {
      super.ativacao = value;
    });
  }

  @override
  String toString() {
    return '''
ativacao: ${ativacao}
    ''';
  }
}
