// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_codigo_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EnviarCodigoController = BindInject(
  (i) => EnviarCodigoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnviarCodigoController on _EnviarCodigoControllerBase, Store {
  final _$emailsAtom = Atom(name: '_EnviarCodigoControllerBase.emails');

  @override
  ResourceData<List<EmailAtivacaoEntity>> get emails {
    _$emailsAtom.reportRead();
    return super.emails;
  }

  @override
  set emails(ResourceData<List<EmailAtivacaoEntity>> value) {
    _$emailsAtom.reportWrite(value, super.emails, () {
      super.emails = value;
    });
  }

  final _$getEmailsAsyncAction =
      AsyncAction('_EnviarCodigoControllerBase.getEmails');

  @override
  Future getEmails() {
    return _$getEmailsAsyncAction.run(() => super.getEmails());
  }

  @override
  String toString() {
    return '''
emails: ${emails}
    ''';
  }
}
