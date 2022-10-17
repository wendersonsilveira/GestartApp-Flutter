// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segunda_via_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SegundaViaController = BindInject(
  (i) => SegundaViaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SegundaViaController on _SegundaViaControllerBase, Store {
  final _$hasFaturasAtom = Atom(name: '_SegundaViaControllerBase.hasFaturas');

  @override
  bool get hasFaturas {
    _$hasFaturasAtom.reportRead();
    return super.hasFaturas;
  }

  @override
  set hasFaturas(bool value) {
    _$hasFaturasAtom.reportWrite(value, super.hasFaturas, () {
      super.hasFaturas = value;
    });
  }

  final _$checkedAtom = Atom(name: '_SegundaViaControllerBase.checked');

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  final _$_getBoletosAtom = Atom(name: '_SegundaViaControllerBase._getBoletos');

  @override
  GetBoletosDocUseCase get _getBoletos {
    _$_getBoletosAtom.reportRead();
    return super._getBoletos;
  }

  @override
  set _getBoletos(GetBoletosDocUseCase value) {
    _$_getBoletosAtom.reportWrite(value, super._getBoletos, () {
      super._getBoletos = value;
    });
  }

  final _$boletosAtom = Atom(name: '_SegundaViaControllerBase.boletos');

  @override
  ResourceData<List<BoletoEntity>> get boletos {
    _$boletosAtom.reportRead();
    return super.boletos;
  }

  @override
  set boletos(ResourceData<List<BoletoEntity>> value) {
    _$boletosAtom.reportWrite(value, super.boletos, () {
      super.boletos = value;
    });
  }

  final _$loadingCheckAtom =
      Atom(name: '_SegundaViaControllerBase.loadingCheck');

  @override
  ResourceData<int> get loadingCheck {
    _$loadingCheckAtom.reportRead();
    return super.loadingCheck;
  }

  @override
  set loadingCheck(ResourceData<int> value) {
    _$loadingCheckAtom.reportWrite(value, super.loadingCheck, () {
      super.loadingCheck = value;
    });
  }

  final _$userLoginAtom = Atom(name: '_SegundaViaControllerBase.userLogin');

  @override
  ResourceData<UserEntity> get userLogin {
    _$userLoginAtom.reportRead();
    return super.userLogin;
  }

  @override
  set userLogin(ResourceData<UserEntity> value) {
    _$userLoginAtom.reportWrite(value, super.userLogin, () {
      super.userLogin = value;
    });
  }

  final _$getBoletosAsyncAction =
      AsyncAction('_SegundaViaControllerBase.getBoletos');

  @override
  Future<void> getBoletos(String cpfCnpj) {
    return _$getBoletosAsyncAction.run(() => super.getBoletos(cpfCnpj));
  }

  final _$_SegundaViaControllerBaseActionController =
      ActionController(name: '_SegundaViaControllerBase');

  @override
  Future<void> checkPage() {
    final _$actionInfo = _$_SegundaViaControllerBaseActionController
        .startAction(name: '_SegundaViaControllerBase.checkPage');
    try {
      return super.checkPage();
    } finally {
      _$_SegundaViaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasFaturas: ${hasFaturas},
checked: ${checked},
boletos: ${boletos},
loadingCheck: ${loadingCheck},
userLogin: ${userLogin}
    ''';
  }
}
