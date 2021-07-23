// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infor_condominio_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InforCondominioController = BindInject(
  (i) => InforCondominioController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InforCondominioController on _InforCondominioControllerBase, Store {
  final _$condominiosAtom =
      Atom(name: '_InforCondominioControllerBase.condominios');

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

  final _$condAtom = Atom(name: '_InforCondominioControllerBase.cond');

  @override
  List<CondominiosAtivosEntity> get cond {
    _$condAtom.reportRead();
    return super.cond;
  }

  @override
  set cond(List<CondominiosAtivosEntity> value) {
    _$condAtom.reportWrite(value, super.cond, () {
      super.cond = value;
    });
  }

  final _$listViewAtom = Atom(name: '_InforCondominioControllerBase.listView');

  @override
  List<UserAdmEntity> get listView {
    _$listViewAtom.reportRead();
    return super.listView;
  }

  @override
  set listView(List<UserAdmEntity> value) {
    _$listViewAtom.reportWrite(value, super.listView, () {
      super.listView = value;
    });
  }

  final _$codConAtom = Atom(name: '_InforCondominioControllerBase.codCon');

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

  final _$inforAdmCondAtom =
      Atom(name: '_InforCondominioControllerBase.inforAdmCond');

  @override
  ResourceData<List<UserAdmEntity>> get inforAdmCond {
    _$inforAdmCondAtom.reportRead();
    return super.inforAdmCond;
  }

  @override
  set inforAdmCond(ResourceData<List<UserAdmEntity>> value) {
    _$inforAdmCondAtom.reportWrite(value, super.inforAdmCond, () {
      super.inforAdmCond = value;
    });
  }

  final _$_InforCondominioControllerBaseActionController =
      ActionController(name: '_InforCondominioControllerBase');

  @override
  dynamic changeDropdown(int codCond) {
    final _$actionInfo = _$_InforCondominioControllerBaseActionController
        .startAction(name: '_InforCondominioControllerBase.changeDropdown');
    try {
      return super.changeDropdown(codCond);
    } finally {
      _$_InforCondominioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
condominios: ${condominios},
cond: ${cond},
listView: ${listView},
codCon: ${codCon},
inforAdmCond: ${inforAdmCond}
    ''';
  }
}
