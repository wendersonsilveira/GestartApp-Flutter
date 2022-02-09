// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condominio_online_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CondominioOnlineController = BindInject(
  (i) => CondominioOnlineController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CondominioOnlineController on _CondominioOnlineControllerBase, Store {
  final _$statusAtivacaoAtom =
      Atom(name: '_CondominioOnlineControllerBase.statusAtivacao');

  @override
  ResourceData<int> get statusAtivacao {
    _$statusAtivacaoAtom.reportRead();
    return super.statusAtivacao;
  }

  @override
  set statusAtivacao(ResourceData<int> value) {
    _$statusAtivacaoAtom.reportWrite(value, super.statusAtivacao, () {
      super.statusAtivacao = value;
    });
  }

  final _$statusAtom = Atom(name: '_CondominioOnlineControllerBase.status');

  @override
  ResourceData<int> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ResourceData<int> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$ativarCondominioAsyncAction =
      AsyncAction('_CondominioOnlineControllerBase.ativarCondominio');

  @override
  Future<ResourceData<int>> ativarCondominio(LoginAuthEntity credenciais) {
    return _$ativarCondominioAsyncAction
        .run(() => super.ativarCondominio(credenciais));
  }

  @override
  String toString() {
    return '''
statusAtivacao: ${statusAtivacao},
status: ${status}
    ''';
  }
}
