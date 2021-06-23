import 'dart:convert';

import 'package:Gestart/domain/entities/auth/check_auth_entity.dart';

extension CheckAuthMapper on CheckAuthEntity {
  CheckAuthEntity copyWith({
    String cpfCnpj,
  }) {
    return CheckAuthEntity(cpfCnpj: cpfCnpj ?? this.cpfCnpj);
  }

  Map<String, dynamic> toMap() {
    return {
      'USUARIO': cpfCnpj,
    };
  }

  String toJson() => json.encode(toMap());
}
