import 'package:flutter/foundation.dart';

@immutable
class NotificacaoEntity {
  final int id;
  final String tipo;
  final String modulo;
  final String openPage;
  final DateTime createAt;
  final String destino;
  final String origem;
  final int destinoId;
  final int origemId;
  final String titulo;
  final String mensagem;
  final String carga;
  final DateTime datClick;
  final DateTime datSend;
  final String messageId;
  final int itemId;
  final String linkPhoto;

  const NotificacaoEntity(
      {this.id,
      this.tipo,
      this.modulo,
      this.openPage,
      this.createAt,
      this.destino,
      this.origem,
      this.destinoId,
      this.origemId,
      this.titulo,
      this.mensagem,
      this.carga,
      this.datClick,
      this.datSend,
      this.messageId,
      this.itemId,
      this.linkPhoto});

  @override
  String toString() {
    return 'NotificaoEntity(id: $id, tipo: $tipo, modulo: $modulo, openPage: $openPage, createAt: $createAt, destino: $destino, origem: $origem, destinoId: $destinoId, origemId: $origemId, titulo: $titulo, mensagem: $mensagem, carga: $carga, datClick: $datClick, datSend: $datSend, messageId: $messageId, itemId: $itemId, linkPhoto: $linkPhoto)';
  }
}
