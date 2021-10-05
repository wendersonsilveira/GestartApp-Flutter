// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balancete_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BalanceteController = BindInject(
  (i) => BalanceteController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceteController on _BalanceteControllerBase, Store {
  final _$condominiosAtom = Atom(name: '_BalanceteControllerBase.condominios');

  @override
  List<CondominiosAtivosEntity> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(List<CondominiosAtivosEntity> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$codConAtom = Atom(name: '_BalanceteControllerBase.codCon');

  @override
  int get codCon {
    _$codConAtom.reportRead();
    return super.codCon;
  }

  @override
  set codCon(int value) {
    _$codConAtom.reportWrite(value, super.codCon, () {
      super.codCon = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_BalanceteControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$balancetesAtom = Atom(name: '_BalanceteControllerBase.balancetes');

  @override
  List<BalanceteEntity> get balancetes {
    _$balancetesAtom.reportRead();
    return super.balancetes;
  }

  @override
  set balancetes(List<BalanceteEntity> value) {
    _$balancetesAtom.reportWrite(value, super.balancetes, () {
      super.balancetes = value;
    });
  }

  final _$getBalancetesAsyncAction =
      AsyncAction('_BalanceteControllerBase.getBalancetes');

  @override
  Future<dynamic> getBalancetes() {
    return _$getBalancetesAsyncAction.run(() => super.getBalancetes());
  }

  final _$_BalanceteControllerBaseActionController =
      ActionController(name: '_BalanceteControllerBase');

  @override
  Future<dynamic> filterBalancetes(int id) {
    final _$actionInfo = _$_BalanceteControllerBaseActionController.startAction(
        name: '_BalanceteControllerBase.filterBalancetes');
    try {
      return super.filterBalancetes(id);
    } finally {
      _$_BalanceteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
condominios: ${condominios},
codCon: ${codCon},
isLoading: ${isLoading},
balancetes: ${balancetes}
    ''';
  }
}
