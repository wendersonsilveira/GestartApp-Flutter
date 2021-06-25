// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DashboardController = BindInject(
  (i) => DashboardController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$condominiosAtom = Atom(name: '_DashboardControllerBase.condominios');

  @override
  ResourceData<CondominioEntity> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(ResourceData<CondominioEntity> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$getCondominioPorCpfAsyncAction =
      AsyncAction('_DashboardControllerBase.getCondominioPorCpf');

  @override
  Future getCondominioPorCpf() {
    return _$getCondominioPorCpfAsyncAction
        .run(() => super.getCondominioPorCpf());
  }

  final _$getCondominiosAtivosAsyncAction =
      AsyncAction('_DashboardControllerBase.getCondominiosAtivos');

  @override
  Future getCondominiosAtivos() {
    return _$getCondominiosAtivosAsyncAction
        .run(() => super.getCondominiosAtivos());
  }

  @override
  String toString() {
    return '''
condominios: ${condominios}
    ''';
  }
}
