import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  final int status;
  final String token;
  final int id;
  final String nome;
  final String sobreNome;
  final String email;
  final String telefone;
  final String cpfCnpj;
  final String linkPhoto;

  const UserEntity({
    this.status,
    this.token,
    this.id,
    this.nome,
    this.sobreNome,
    this.email,
    this.telefone,
    this.cpfCnpj,
    this.linkPhoto,
  });

  @override
  String toString() {
    return 'UserEntity(nome: $nome,sobreNome: $sobreNome, email: $email,telefone: $telefone,cpfCnpj: $cpfCnpj)';
  }
}
