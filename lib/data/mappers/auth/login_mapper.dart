import 'dart:convert';

import 'package:Gestart/domain/entities/auth/login_entity.dart';

extension LoginAuthMapper on LoginAuthEntity {
  LoginAuthEntity copyWith({
    String usuario,
    String senha,
  }) {
    return LoginAuthEntity(
      usuario: usuario ?? this.usuario,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'USUARIO': usuario,
      'SENHA': senha,
    };
  }

  String toJson() => json.encode(toMap());
}
