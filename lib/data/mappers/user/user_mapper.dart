import 'dart:convert';

import 'package:Gestart/domain/entities/auth/login_entity.dart';
import 'package:Gestart/domain/entities/user/user_entity.dart';

extension UserMapper on UserEntity {
  UserEntity copyWith({
    int status,
    String token,
    int id,
    String nome,
    String sobreNome,
    String email,
    String telefone,
    String cpfCnpj,
  }) {
    return UserEntity(
      status: status ?? this.status,
      token: token ?? this.token,
      id: id ?? this.id,
      nome: nome ?? this.nome,
      sobreNome: sobreNome ?? this.sobreNome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
    );
  }

  UserEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserEntity(
      status: map['status'],
      cpfCnpj: map['CPFCNPJ'],
      email: map['email'],
      id: map['ID'],
      nome: map['NOME'],
      sobreNome: map['SOBRENOME'],
      telefone: map['TELEFONE'],
      token: map['TOKEN'],
    );
  }
}
