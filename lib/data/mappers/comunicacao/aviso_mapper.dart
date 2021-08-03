import 'package:Gestart/domain/entities/comunicacao/aviso_entity.dart';

extension AvisoMapper on AvisoEntity {
  List<AvisoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  AvisoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AvisoEntity(
      id: map['ID'],
      codCon: map['CODCON'],
      datEmi: map['DATEMI'],
      att: map['ATT'],
      descri: map['DESCRI'],
      urlDigital: map['URL_DIGITAL'],
      atenciosamente: map['ATENCIOSAMENTE'],
      condonUserId: map['CONDON_USER_ID'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id != null ? id : 0,
    };
  }
}
