// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informativos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InformativosController = BindInject(
  (i) => InformativosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InformativosController on _InformativosControllerBase, Store {
  final _$condominiosAtom =
      Atom(name: '_InformativosControllerBase.condominios');

  @override
  ResourceData<List<UnidadeAtivaEntity>> get condominios {
    _$condominiosAtom.reportRead();
    return super.condominios;
  }

  @override
  set condominios(ResourceData<List<UnidadeAtivaEntity>> value) {
    _$condominiosAtom.reportWrite(value, super.condominios, () {
      super.condominios = value;
    });
  }

  final _$codConAtom = Atom(name: '_InformativosControllerBase.codCon');

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

  final _$inforAtom = Atom(name: '_InformativosControllerBase.infor');

  @override
  ResourceData<List<FeedEntity>> get infor {
    _$inforAtom.reportRead();
    return super.infor;
  }

  @override
  set infor(ResourceData<List<FeedEntity>> value) {
    _$inforAtom.reportWrite(value, super.infor, () {
      super.infor = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_InformativosControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getCondominiosAsyncAction =
      AsyncAction('_InformativosControllerBase.getCondominios');

  @override
  Future<void> getCondominios() {
    return _$getCondominiosAsyncAction.run(() => super.getCondominios());
  }

  final _$_InformativosControllerBaseActionController =
      ActionController(name: '_InformativosControllerBase');

  @override
  dynamic changeDropdown(int codOrd) {
    final _$actionInfo = _$_InformativosControllerBaseActionController
        .startAction(name: '_InformativosControllerBase.changeDropdown');
    try {
      return super.changeDropdown(codOrd);
    } finally {
      _$_InformativosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
condominios: ${condominios},
codCon: ${codCon},
infor: ${infor}
    ''';
  }
}
