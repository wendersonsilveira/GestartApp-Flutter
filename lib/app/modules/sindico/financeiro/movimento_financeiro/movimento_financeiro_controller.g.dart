// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimento_financeiro_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovimentoFinanceiroController = BindInject(
  (i) => MovimentoFinanceiroController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovimentoFinanceiroController
    on _MovimentoFinanceiroControllerBase, Store {
  Computed<int> _$statusPageComputed;

  @override
  int get statusPage =>
      (_$statusPageComputed ??= Computed<int>(() => super.statusPage,
              name: '_MovimentoFinanceiroControllerBase.statusPage'))
          .value;

  final _$movimentacaoAtom =
      Atom(name: '_MovimentoFinanceiroControllerBase.movimentacao');

  @override
  ResourceData<List<MovFinanceiroEntity>> get movimentacao {
    _$movimentacaoAtom.reportRead();
    return super.movimentacao;
  }

  @override
  set movimentacao(ResourceData<List<MovFinanceiroEntity>> value) {
    _$movimentacaoAtom.reportWrite(value, super.movimentacao, () {
      super.movimentacao = value;
    });
  }

  final _$mesesAtom = Atom(name: '_MovimentoFinanceiroControllerBase.meses');

  @override
  ResourceData<List<MovFinanceiroMesesEntity>> get meses {
    _$mesesAtom.reportRead();
    return super.meses;
  }

  @override
  set meses(ResourceData<List<MovFinanceiroMesesEntity>> value) {
    _$mesesAtom.reportWrite(value, super.meses, () {
      super.meses = value;
    });
  }

  final _$mesIndexAtom =
      Atom(name: '_MovimentoFinanceiroControllerBase.mesIndex');

  @override
  int get mesIndex {
    _$mesIndexAtom.reportRead();
    return super.mesIndex;
  }

  @override
  set mesIndex(int value) {
    _$mesIndexAtom.reportWrite(value, super.mesIndex, () {
      super.mesIndex = value;
    });
  }

  final _$mesAtualAtom =
      Atom(name: '_MovimentoFinanceiroControllerBase.mesAtual');

  @override
  MovFinanceiroMesesEntity get mesAtual {
    _$mesAtualAtom.reportRead();
    return super.mesAtual;
  }

  @override
  set mesAtual(MovFinanceiroMesesEntity value) {
    _$mesAtualAtom.reportWrite(value, super.mesAtual, () {
      super.mesAtual = value;
    });
  }

  final _$saldoAtom = Atom(name: '_MovimentoFinanceiroControllerBase.saldo');

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

  final _$getMovimentacaoAsyncAction =
      AsyncAction('_MovimentoFinanceiroControllerBase.getMovimentacao');

  @override
  Future<dynamic> getMovimentacao(String mesAno) {
    return _$getMovimentacaoAsyncAction
        .run(() => super.getMovimentacao(mesAno));
  }

  final _$initAsyncAction =
      AsyncAction('_MovimentoFinanceiroControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_MovimentoFinanceiroControllerBaseActionController =
      ActionController(name: '_MovimentoFinanceiroControllerBase');

  @override
  dynamic calcularSaldo() {
    final _$actionInfo = _$_MovimentoFinanceiroControllerBaseActionController
        .startAction(name: '_MovimentoFinanceiroControllerBase.calcularSaldo');
    try {
      return super.calcularSaldo();
    } finally {
      _$_MovimentoFinanceiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic inserirMesAtual(dynamic index) {
    final _$actionInfo =
        _$_MovimentoFinanceiroControllerBaseActionController.startAction(
            name: '_MovimentoFinanceiroControllerBase.inserirMesAtual');
    try {
      return super.inserirMesAtual(index);
    } finally {
      _$_MovimentoFinanceiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarPeriodo(int inc) {
    final _$actionInfo = _$_MovimentoFinanceiroControllerBaseActionController
        .startAction(name: '_MovimentoFinanceiroControllerBase.mudarPeriodo');
    try {
      return super.mudarPeriodo(inc);
    } finally {
      _$_MovimentoFinanceiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movimentacao: ${movimentacao},
meses: ${meses},
mesIndex: ${mesIndex},
mesAtual: ${mesAtual},
saldo: ${saldo},
statusPage: ${statusPage}
    ''';
  }
}
