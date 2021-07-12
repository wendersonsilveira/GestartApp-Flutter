import 'package:flutter/foundation.dart';

@immutable
class PasswordEntity {
  final String senha;
  final String senhaNova;
  final String senhaConfirmacao;

  const PasswordEntity({this.senha, this.senhaNova, this.senhaConfirmacao});

  @override
  String toString() =>
      'PasswordEntity(senha: $senha, senhaNova: $senhaNova, senhaConfirmacao: $senhaConfirmacao)';
}
