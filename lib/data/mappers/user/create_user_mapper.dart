import 'dart:convert';

import 'package:Gestart/domain/entities/user/create_user_entity.dart';

extension CreateUserMapper on CreateUserEntity {
  CreateUserEntity copyWith(
      {String nome,
      String sobreNome,
      String email,
      String confirmaEmail,
      String telefone,
      String cpfCnpj,
      String senha,
      String confirmaSenha}) {
    return CreateUserEntity(
      nome: nome ?? this.nome,
      sobreNome: sobreNome ?? this.sobreNome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      senha: senha ?? this.senha,
      confirmaEmail: confirmaEmail ?? this.confirmaEmail,
      confirmaSenha: confirmaSenha ?? this.confirmaSenha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'NOME': nome,
      'SOBRENOME': sobreNome,
      'EMAIL': email,
      'EMAIL_CONFIRMA': confirmaEmail,
      'TELEFONE': telefone,
      'CPFCNPJ': cpfCnpj,
      'SENHA': senha,
      'SENHA_CONFIRMA': confirmaSenha,
    };
  }

  String toJson() => json.encode(toMap());
}
