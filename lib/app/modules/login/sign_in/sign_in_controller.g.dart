// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignInController = BindInject(
  (i) => SignInController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInController on _SignInControllerBase, Store {
  final _$loadingCheckAtom = Atom(name: '_SignInControllerBase.loadingCheck');

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

  final _$userLoginAtom = Atom(name: '_SignInControllerBase.userLogin');

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

  final _$usuarioCadastradoAtom =
      Atom(name: '_SignInControllerBase.usuarioCadastrado');

  @override
  bool get usuarioCadastrado {
    _$usuarioCadastradoAtom.reportRead();
    return super.usuarioCadastrado;
  }

  @override
  set usuarioCadastrado(bool value) {
    _$usuarioCadastradoAtom.reportWrite(value, super.usuarioCadastrado, () {
      super.usuarioCadastrado = value;
    });
  }

  final _$checkUserAsyncAction = AsyncAction('_SignInControllerBase.checkUser');

  @override
  Future<ResourceData<int>> checkUser(IdUserEntity cpfCnpj) {
    return _$checkUserAsyncAction.run(() => super.checkUser(cpfCnpj));
  }

  final _$loginAsyncAction = AsyncAction('_SignInControllerBase.login');

  @override
  Future<ResourceData<UserEntity>> login(LoginAuthEntity entity) {
    return _$loginAsyncAction.run(() => super.login(entity));
  }

  final _$_SignInControllerBaseActionController =
      ActionController(name: '_SignInControllerBase');

  @override
  void mudarStatusUsuario(dynamic value) {
    final _$actionInfo = _$_SignInControllerBaseActionController.startAction(
        name: '_SignInControllerBase.mudarStatusUsuario');
    try {
      return super.mudarStatusUsuario(value);
    } finally {
      _$_SignInControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingCheck: ${loadingCheck},
userLogin: ${userLogin},
usuarioCadastrado: ${usuarioCadastrado}
    ''';
  }
}
