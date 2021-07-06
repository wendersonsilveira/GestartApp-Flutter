// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boleto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BoletoController = BindInject(
  (i) => BoletoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoletoController on _BoletoControllerBase, Store {
  final _$condominiosAtom = Atom(name: '_BoletoControllerBase.condominios');

  @override
  ResourceData<List<CondominiosAtivosEntity>> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(ResourceData<List<CondominiosAtivosEntity>> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$getCondominiosAsyncAction =
      AsyncAction('_BoletoControllerBase.getCondominios');

  @override
  Future getCondominios() {
    return _$getCondominiosAsyncAction.run(() => super.getCondominios());
  }

  @override
  String toString() {
    return '''
condominios: ${condominios}
    ''';
  }
}
