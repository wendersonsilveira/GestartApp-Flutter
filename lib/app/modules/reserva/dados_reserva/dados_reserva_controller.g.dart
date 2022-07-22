// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_reserva_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosReservaController = BindInject(
  (i) => DadosReservaController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosReservaController on _DadosReservaControllerBase, Store {
  final _$reservaAtom = Atom(name: '_DadosReservaControllerBase.reserva');

  @override
  ResourceData<ReservaEntity> get reserva {
    _$reservaAtom.reportRead();
    return super.reserva;
  }

  @override
  set reserva(ResourceData<ReservaEntity> value) {
    _$reservaAtom.reportWrite(value, super.reserva, () {
      super.reserva = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_DadosReservaControllerBase.init');

  @override
  Future init(int idReserva) {
    return _$initAsyncAction.run(() => super.init(idReserva));
  }

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
reserva: ${reserva}
    ''';
  }
}
