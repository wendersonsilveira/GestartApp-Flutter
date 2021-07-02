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

  const UserEntity(
      {this.status,
      this.token,
      this.id,
      this.nome,
      this.sobreNome,
      this.email,
      this.telefone,
      this.cpfCnpj});

  @override
  String toString() {
    return 'UserEntity(nome: $nome,sobreNome: $sobreNome, email: $email,telefone: $telefone,cpfCnpj: $cpfCnpj)';
  }

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is AuthEntity && o.email == email && o.password == password;
  // }

  // @override
  // int get hashCode {
  //   return email.hashCode ^ password.hashCode;
  // }
}
