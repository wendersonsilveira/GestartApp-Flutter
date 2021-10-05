// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PerfilController = BindInject(
  (i) => PerfilController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$perfilAtom = Atom(name: '_PerfilControllerBase.perfil');

  @override
  ResourceData<UserEntity> get perfil {
    _$perfilAtom.reportRead();
    return super.perfil;
  }

  @override
  set perfil(ResourceData<UserEntity> value) {
    _$perfilAtom.reportWrite(value, super.perfil, () {
      super.perfil = value;
    });
  }

  final _$statusAlterarSenhaAtom =
      Atom(name: '_PerfilControllerBase.statusAlterarSenha');

  @override
  ResourceData<dynamic> get statusAlterarSenha {
    _$statusAlterarSenhaAtom.reportRead();
    return super.statusAlterarSenha;
  }

  @override
  set statusAlterarSenha(ResourceData<dynamic> value) {
    _$statusAlterarSenhaAtom.reportWrite(value, super.statusAlterarSenha, () {
      super.statusAlterarSenha = value;
    });
  }

  final _$checarSenhaStatusAtom =
      Atom(name: '_PerfilControllerBase.checarSenhaStatus');

  @override
  ResourceData<bool> get checarSenhaStatus {
    _$checarSenhaStatusAtom.reportRead();
    return super.checarSenhaStatus;
  }

  @override
  set checarSenhaStatus(ResourceData<bool> value) {
    _$checarSenhaStatusAtom.reportWrite(value, super.checarSenhaStatus, () {
      super.checarSenhaStatus = value;
    });
  }

  final _$excluirContaStatusAtom =
      Atom(name: '_PerfilControllerBase.excluirContaStatus');

  @override
  ResourceData<int> get excluirContaStatus {
    _$excluirContaStatusAtom.reportRead();
    return super.excluirContaStatus;
  }

  @override
  set excluirContaStatus(ResourceData<int> value) {
    _$excluirContaStatusAtom.reportWrite(value, super.excluirContaStatus, () {
      super.excluirContaStatus = value;
    });
  }

  @override
  String toString() {
    return '''
perfil: ${perfil},
statusAlterarSenha: ${statusAlterarSenha},
checarSenhaStatus: ${checarSenhaStatus},
excluirContaStatus: ${excluirContaStatus}
    ''';
  }
}
