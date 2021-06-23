import 'package:flutter/foundation.dart';

@immutable
class CreateUserEntity {
  final String nome;
  final String sobreNome;
  final String email;
  final String confirmaEmail;
  final String telefone;
  final String cpfCnpj;
  final String senha;
  final String confirmaSenha;

  const CreateUserEntity(
      {this.nome,
      this.sobreNome,
      this.email,
      this.confirmaEmail,
      this.telefone,
      this.senha,
      this.confirmaSenha,
      this.cpfCnpj});

  @override
  String toString() {
    return 'CreateUserEntity(nome: $nome,sobreNome: $sobreNome, email: $email,telefone: $telefone,senha: $senha,cpfCnpj: $cpfCnpj)';
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
