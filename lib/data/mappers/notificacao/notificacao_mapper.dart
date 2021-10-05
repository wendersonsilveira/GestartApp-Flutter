import 'package:Gestart/domain/entities/notificacao/notificacao_entity.dart';

extension NotificacaoMapper on NotificacaoEntity {
  List<NotificacaoEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  NotificacaoEntity fromMap(Map<String, dynamic> map) {
    return NotificacaoEntity(
      id: map['ID'],
      carga: map['CARGA'],
      createAt: DateTime.parse(map['CREATEAT']),
      tipo: map['TIPO'],
      modulo: map['MODULO'],
      openPage: map['OPENPAGE'],
      destino: map['DESTINO'],
      origem: map['ORIGEM'],
      destinoId: map['DESTINO_ID'],
      origemId: map['ORIGEM_ID'],
      titulo: map['TITULO'],
      mensagem: map['MENSAGEM'],
      datClick: map['DATCLICK'] != null ? DateTime.parse(map['DATCLICK']) : null,
      datSend: map['DATSEND'] != null ? DateTime.parse(map['DATSEND']) : null,
      messageId: map['MESSAGE_ID'],
      itemId: map['ITEM_ID'],
      linkPhoto: map['LINK_PHOTO'],
    );
  }
}
