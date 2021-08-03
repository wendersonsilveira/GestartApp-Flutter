import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class ContasEntity {
  final String tipo;
  final int tipFor;
  final int codCon;
  final int tipCon;
  final int codFor;
  final int tipoContrato;
  final int diaVen;
  final String mesVencimento;
  final int tipPag;
  final double valCon;
  final DateTime datEmi;
  final String numMins;
  final String senha;
  final String codPla;
  final int codCed;
  final int codHis;
  final String tipHis;
  final DateTime datIni;
  final String quaPar;
  final int nominal;
  final bool debaut;
  final bool dds;
  final int id;
  final String forPag;
  final String codFinTed;
  final int idContaDeb;
  final bool gerarMedia;
  final bool considerarMedia;
  final int pagEletronico;
  final int idContaCredito;
  final String nomFor;
  final String valorMedia;
  final String nomPla;
  final String nomCla;
  final String apelido;
  final String nomCon;

  const ContasEntity(
      {this.tipo,
      this.tipFor,
      this.codCon,
      this.tipCon,
      this.codFor,
      this.tipoContrato,
      this.diaVen,
      this.mesVencimento,
      this.tipPag,
      this.valCon,
      this.datEmi,
      this.numMins,
      this.senha,
      this.codPla,
      this.codCed,
      this.codHis,
      this.tipHis,
      this.datIni,
      this.quaPar,
      this.nominal,
      this.debaut,
      this.dds,
      this.id,
      this.forPag,
      this.codFinTed,
      this.idContaDeb,
      this.gerarMedia,
      this.considerarMedia,
      this.pagEletronico,
      this.idContaCredito,
      this.nomFor,
      this.valorMedia,
      this.nomPla,
      this.nomCla,
      this.apelido,
      this.nomCon});

  @override
  String toString() {
    return 'ContaEntity(tipo: $tipo, tipFor: $tipFor, codCon: $codCon, tipCon: $tipCon, codFor: $codFor, tipoContrato: $tipoContrato, diaVen: $diaVen, mesVencimento: $mesVencimento, tipPag: $tipPag, valCon: $valCon, datEmi: $datEmi, numMins: $numMins, senha: $senha, codPla: $codPla, codCed: $codCed, codHis: $codHis, tipHis: $tipHis, datIni: $datIni, quaPar: $quaPar, nominal: $nominal, debaut: $debaut, dds: $dds, id: $id, forPag: $forPag, codFinTed: $codFinTed, idContaDeb: $idContaDeb, gerarMedia: $gerarMedia, considerarMedia: $considerarMedia, pagEletronico: $pagEletronico, idContaCredito: $idContaCredito, nomFor: $nomFor, valorMedia: $valorMedia, nomPla: $nomPla, nomCla: $nomCla, apelido: $apelido, nomCon: $nomCon)';
  }
}
