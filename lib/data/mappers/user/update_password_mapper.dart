import 'dart:convert';

import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/entities/user/update_password_return_entity.dart';

extension UpdatePasswordMapper on UpdatePasswordEntity {
  UpdatePasswordEntity copyWith({
    String identificador,
  }) {
    return UpdatePasswordEntity(
      identificador: identificador ?? this.identificador,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'USUARIO': identificador,
    };
  }

  UpdatePasswordReturnEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Map<String, dynamic> mapPasswordUpdate;

    mapPasswordUpdate = map;
    return UpdatePasswordReturnEntity(
      status: mapPasswordUpdate['status'],
      email: mapPasswordUpdate['email'],
    );
  }

  String toJson() => json.encode(toMap());
}
