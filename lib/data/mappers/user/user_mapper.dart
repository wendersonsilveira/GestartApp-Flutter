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
    String linkPhoto,
    int forceUpdate
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
      linkPhoto: linkPhoto ?? this.linkPhoto,
      forceUpdate: forceUpdate ?? this.forceUpdate
    );
  }

  UserEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserEntity(
      status: map['status'],
      cpfCnpj: map['CPFCNPJ'],
      email: map['EMAIL'],
      id: map['ID'],
      nome: map['NOME'],
      sobreNome: map['SOBRENOME'],
      telefone: map['TELEFONE'],
      token: map['TOKEN'],
      linkPhoto: map['LINK_PHOTO'],
      forceUpdate: map['FORCAR_ATUALIZACAO']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'NOME': nome,
      'SOBRENOME': sobreNome,
      'EMAIL': email,
      'TELEFONE': telefone,
      'CPFCNPJ': cpfCnpj,
    };
  }
}
