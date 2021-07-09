// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacoes_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NotificacoesController = BindInject(
  (i) => NotificacoesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificacoesController on _NotificacoesControllerBase, Store {
  final _$notificacoesAtom =
      Atom(name: '_NotificacoesControllerBase.notificacoes');

  @override
  ResourceData<List<NotificacaoEntity>> get notificacoes {
    _$notificacoesAtom.reportRead();
    return super.notificacoes;
  }

  @override
  set notificacoes(ResourceData<List<NotificacaoEntity>> value) {
    _$notificacoesAtom.reportWrite(value, super.notificacoes, () {
      super.notificacoes = value;
    });
  }

  @override
  String toString() {
    return '''
notificacoes: ${notificacoes}
    ''';
  }
}
