// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alterar_perfil_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AlterarPerfilController = BindInject(
  (i) => AlterarPerfilController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlterarPerfilController on _AlterarPerfilControllerBase, Store {
  final _$usuarioAtom = Atom(name: '_AlterarPerfilControllerBase.usuario');

  @override
  ResourceData<bool> get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(ResourceData<bool> value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$perfilAtom = Atom(name: '_AlterarPerfilControllerBase.perfil');

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

  final _$alterarAsyncAction =
      AsyncAction('_AlterarPerfilControllerBase.alterar');

  @override
  Future<bool> alterar() {
    return _$alterarAsyncAction.run(() => super.alterar());
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
perfil: ${perfil}
    ''';
  }
}
