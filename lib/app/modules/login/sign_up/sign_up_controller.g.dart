// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignUpController = BindInject(
  (i) => SignUpController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpControllerBase, Store {
  final _$createUserAsyncAction =
      AsyncAction('_SignUpControllerBase.createUser');

  @override
  Future<ResourceData<dynamic>> createUser(CreateUserEntity user) {
    return _$createUserAsyncAction.run(() => super.createUser(user));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
