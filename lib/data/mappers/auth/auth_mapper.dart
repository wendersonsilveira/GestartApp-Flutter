import 'dart:convert';

import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';

extension CheckAuthMapper on IdUserEntity {
  IdUserEntity copyWith({
    String cpfCnpj,
  }) {
    return IdUserEntity(cpfCnpj: cpfCnpj ?? this.cpfCnpj);
  }

  Map<String, dynamic> toMap() {
    return {
      'USUARIO': cpfCnpj,
    };
  }

  String toJson() => json.encode(toMap());
}
