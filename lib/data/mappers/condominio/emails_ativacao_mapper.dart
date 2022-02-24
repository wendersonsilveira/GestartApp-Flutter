import 'package:Gestart/domain/entities/condominio/emails_ativacao_entity.dart';

extension EmailAtivacaoMapper on EmailAtivacaoEntity {
  EmailAtivacaoEntity copyWith({
    int id,
    String email,
  }) {
    return EmailAtivacaoEntity(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  List<EmailAtivacaoEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  EmailAtivacaoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EmailAtivacaoEntity(
      id: map['ID'],
      email: map['EMAIL'],
    );
  }
}
