import 'package:Gestart/domain/entities/user/update_password_return_entity.dart';

extension UpdatePasswordReturnMapper on UpdatePasswordReturnEntity {
  UpdatePasswordReturnEntity copyWith({String email, String status}) {
    return UpdatePasswordReturnEntity(
      email: email ?? this.email,
      status: status ?? this.status,
    );
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
}
