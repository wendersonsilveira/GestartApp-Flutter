// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_reserva_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosReservaController = BindInject(
  (i) => DadosReservaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosReservaController on _DadosReservaControllerBase, Store {
  final _$_DadosReservaControllerBaseActionController =
      ActionController(name: '_DadosReservaControllerBase');

  @override
  Future<ResourceData<dynamic>> cancelarReserva(int id) {
    final _$actionInfo = _$_DadosReservaControllerBaseActionController
        .startAction(name: '_DadosReservaControllerBase.cancelarReserva');
    try {
      return super.cancelarReserva(id);
    } finally {
      _$_DadosReservaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
