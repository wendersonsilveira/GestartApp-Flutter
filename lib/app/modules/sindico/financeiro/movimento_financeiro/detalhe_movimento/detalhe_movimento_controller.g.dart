// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhe_movimento_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalheMovimentoController = BindInject(
  (i) => DetalheMovimentoController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalheMovimentoController on _DetalheMovimentoControllerBase, Store {
  final _$dadosAtom = Atom(name: '_DetalheMovimentoControllerBase.dados');

  @override
  ResourceData<List<ExtratoFinanceiroEntity>> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(ResourceData<List<ExtratoFinanceiroEntity>> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$extratoAtom = Atom(name: '_DetalheMovimentoControllerBase.extrato');

  @override
  List<ExtratoFinanceiroEntity> get extrato {
    _$extratoAtom.reportRead();
    return super.extrato;
  }

  @override
  set extrato(List<ExtratoFinanceiroEntity> value) {
    _$extratoAtom.reportWrite(value, super.extrato, () {
      super.extrato = value;
    });
  }

  final _$extratoVazioAtom =
      Atom(name: '_DetalheMovimentoControllerBase.extratoVazio');

  @override
  List<ExtratoFinanceiroEntity> get extratoVazio {
    _$extratoVazioAtom.reportRead();
    return super.extratoVazio;
  }

  @override
  set extratoVazio(List<ExtratoFinanceiroEntity> value) {
    _$extratoVazioAtom.reportWrite(value, super.extratoVazio, () {
      super.extratoVazio = value;
    });
  }

  final _$saldoAnteriorAtom =
      Atom(name: '_DetalheMovimentoControllerBase.saldoAnterior');

  @override
  ExtratoFinanceiroEntity get saldoAnterior {
    _$saldoAnteriorAtom.reportRead();
    return super.saldoAnterior;
  }

  @override
  set saldoAnterior(ExtratoFinanceiroEntity value) {
    _$saldoAnteriorAtom.reportWrite(value, super.saldoAnterior, () {
      super.saldoAnterior = value;
    });
  }

  final _$saldoAtom = Atom(name: '_DetalheMovimentoControllerBase.saldo');

  @override
  double get saldo {
    _$saldoAtom.reportRead();
    return super.saldo;
  }

  @override
  set saldo(double value) {
    _$saldoAtom.reportWrite(value, super.saldo, () {
      super.saldo = value;
    });
  }

  final _$statusAtom = Atom(name: '_DetalheMovimentoControllerBase.status');

  @override
  bool get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$extratoDiaAtom =
      Atom(name: '_DetalheMovimentoControllerBase.extratoDia');

  @override
  List<dynamic> get extratoDia {
    _$extratoDiaAtom.reportRead();
    return super.extratoDia;
  }

  @override
  set extratoDia(List<dynamic> value) {
    _$extratoDiaAtom.reportWrite(value, super.extratoDia, () {
      super.extratoDia = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_DetalheMovimentoControllerBase.init');

  @override
  Future init(MovFinanceiroEntity entity) {
    return _$initAsyncAction.run(() => super.init(entity));
  }

  @override
  String toString() {
    return '''
dados: ${dados},
extrato: ${extrato},
extratoVazio: ${extratoVazio},
saldoAnterior: ${saldoAnterior},
saldo: ${saldo},
status: ${status},
extratoDia: ${extratoDia}
    ''';
  }
}
