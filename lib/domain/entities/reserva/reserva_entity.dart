import 'package:flutter/foundation.dart';

@immutable
class ReservaEntity {
  final int dia;
  final int mes;
  final int ano;
  final DateTime data;
  final int id;
  final int codcon;
  final int codord;
  final String titulo;
  final String descricao;
  final int espacoId;
  final int condonUserId;
  final int status;
  final String statusDescricao;
  final String motivoRecusa;
  final DateTime datIni;
  final DateTime datFim;
  final int horIniId;
  final int horFimId;
  final DateTime createat;
  final String rejeitarMotivo;
  final int canceladoCondonUserId;
  final String espacoDescricao;
  final String horIniDescricao;
  final String horFimDescricao;
  final String codimo;
  final String apelido;
  final String logo;
  final DateTime datIniOriginal;
  final String proprietario;

  const ReservaEntity({
    this.dia,
    this.mes,
    this.ano,
    this.data,
    this.id,
    this.codcon,
    this.codord,
    this.titulo,
    this.descricao,
    this.espacoId,
    this.condonUserId,
    this.status,
    this.statusDescricao,
    this.motivoRecusa,
    this.datIni,
    this.datFim,
    this.horIniId,
    this.horFimId,
    this.createat,
    this.rejeitarMotivo,
    this.canceladoCondonUserId,
    this.espacoDescricao,
    this.horIniDescricao,
    this.horFimDescricao,
    this.codimo,
    this.apelido,
    this.logo,
    this.datIniOriginal,
    this.proprietario
  });
}
