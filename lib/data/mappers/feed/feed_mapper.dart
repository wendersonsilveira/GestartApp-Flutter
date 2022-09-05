import 'package:Gestart/domain/entities/feed/feed_entity.dart';

extension FeedMapper on FeedEntity {
  List<FeedEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  FeedEntity fromMap(Map<String, dynamic> map) {
    return FeedEntity(
      codCon: map['CODCON'],
      datEmi: DateTime.parse(map['DATEMI']),
      att: map['ATT'],
      descricao: map['DESCRI'],
      atensiosamente: map['ATENCIOSAMENTE'],
      urlDigital: map['URL_DIGITAL'],
      linkMalaDireta: map['LINK_MALADIRETA'],
      condonUserId: map['CONDON_USER_ID'],
      id: map['ID'],
      apelido: map['APELIDO'],
      logo: map['LOGO'],
    );
  }
}
