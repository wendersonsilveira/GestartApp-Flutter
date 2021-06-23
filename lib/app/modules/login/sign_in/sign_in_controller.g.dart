// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignInController = BindInject(
  (i) => SignInController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInController on _SignInControllerBase, Store {
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
  Future<ResourceData<int>> checkUser(String cpfCnpj) {
    return _$checkUserAsyncAction.run(() => super.checkUser(cpfCnpj));
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
usuarioCadastrado: ${usuarioCadastrado}
    ''';
  }
}
