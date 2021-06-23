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
  final _$updatePasswordAsyncAction =
      AsyncAction('_ForgotPasswordControllerBase.updatePassword');

  @override
  Future<ResourceData<dynamic>> updatePassword(UpdatePasswordEntity usuario) {
    return _$updatePasswordAsyncAction.run(() => super.updatePassword(usuario));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
