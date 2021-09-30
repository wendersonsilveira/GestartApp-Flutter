import 'package:Gestart/domain/entities/condominio/condominio_entity.dart';
import 'package:Gestart/domain/entities/condominio/emails_ativacao_entity.dart';

extension EmailAtivacaoMapper on EmailAtivacaoEntity {
  CondominioEntity copyWith({
    int id,
    String email,
  }) {
    EmailAtivacaoEntity(
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
