// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_balancete_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalheBalanceteController = BindInject(
  (i) => DetalheBalanceteController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheBalanceteController on _DetalheBalanceteControllerBase, Store {
  final _$balanceteAtom =
      Atom(name: '_DetalheBalanceteControllerBase.balancete');

  @override
  ResourceData<BalanceteEntity> get balancete {
    _$balanceteAtom.reportRead();
    return super.balancete;
  }

  @override
  set balancete(ResourceData<BalanceteEntity> value) {
    _$balanceteAtom.reportWrite(value, super.balancete, () {
      super.balancete = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_DetalheBalanceteControllerBase.init');

  @override
  Future init({dynamic idBalancete}) {
    return _$initAsyncAction.run(() => super.init(idBalancete: idBalancete));
  }

  @override
  String toString() {
    return '''
balancete: ${balancete}
    ''';
  }
}
