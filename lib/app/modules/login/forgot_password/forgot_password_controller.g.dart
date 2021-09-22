// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ForgotPasswordController = BindInject(
  (i) => ForgotPasswordController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on _ForgotPasswordControllerBase, Store {
  final _$loadingAtom = Atom(name: '_ForgotPasswordControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$updatePasswordAsyncAction =
      AsyncAction('_ForgotPasswordControllerBase.updatePassword');

  @override
  Future<ResourceData<dynamic>> updatePassword(UpdatePasswordEntity usuario) {
    return _$updatePasswordAsyncAction.run(() => super.updatePassword(usuario));
  }

  final _$_ForgotPasswordControllerBaseActionController =
      ActionController(name: '_ForgotPasswordControllerBase');

  @override
  dynamic stopLoading() {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
