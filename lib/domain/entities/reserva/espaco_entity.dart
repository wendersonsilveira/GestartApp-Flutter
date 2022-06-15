import 'package:flutter/foundation.dart';

@immutable
class EspacoEntity {
  final int id;
  final int codcon;
  final String descricao;
  final String obs;
  final int capacidade;
  final int perMin;
  final int perMax;
  final int antMin;
  final int antMax;
  final int intRes;
  final bool dom;
  final int domIni;
  final int domFim;
  final bool seg;
  final int segIni;
  final int segFim;
  final bool ter;
  final int terIni;
  final int terFim;
  final bool qua;
  final int quaIni;
  final int quaFim;
  final bool qui;
  final int quiIni;
  final int quiFim;
  final bool sex;
  final int sexIni;
  final int sexFim;
  final bool sab;
  final int sabIni;
  final int sabFim;
  final bool aprovacao;
  final bool apenasMaster;
  final String restricoes;
  final DateTime deletedAt;
  final String identificador;
  final int maxRes;
  final int intResNew;
  final String feriadosIds;
  final int maxResTempo;
  final String apelido;
  final String logo;
  final bool statusEspaco;

  const EspacoEntity({
    this.id,
    this.codcon,
    this.descricao,
    this.obs,
    this.capacidade,
    this.perMin,
    this.perMax,
    this.antMin,
    this.antMax,
    this.intRes,
    this.dom,
    this.domIni,
    this.domFim,
    this.seg,
    this.segIni,
    this.segFim,
    this.ter,
    this.terIni,
    this.terFim,
    this.qua,
    this.quaIni,
    this.quaFim,
    this.qui,
    this.quiIni,
    this.quiFim,
    this.sex,
    this.sexIni,
    this.sexFim,
    this.sab,
    this.sabIni,
    this.sabFim,
    this.aprovacao,
    this.apenasMaster,
    this.restricoes,
    this.deletedAt,
    this.identificador,
    this.maxRes,
    this.intResNew,
    this.feriadosIds,
    this.maxResTempo,
    this.apelido,
    this.logo,
    this.statusEspaco,
  });

  String espacoAsString() {
    return '${this.descricao}';
  }
}
