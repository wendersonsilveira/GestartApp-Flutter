import 'package:Gestart/domain/entities/user/password_entity.dart';

extension PasswordMapper on PasswordEntity {
  Map<String, dynamic> toMap() {
    return {
      'SENHA_ATUAL': senha,
      'SENHA_NOVA': senhaNova,
      'SENHA_NOVA_CONFIRMAR': senhaConfirmacao
    };
  }

  // UpdatePasswordReturnEntity fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null;
  //   Map<String, dynamic> mapPasswordUpdate;

  //   mapPasswordUpdate = map;
  //   return UpdatePasswordReturnEntity(
  //     status: mapPasswordUpdate['status'],
  //     email: mapPasswordUpdate['email'],
  //   );
  // }

  // String toJson() => json.encode(toMap());
}
