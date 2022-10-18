import 'package:flutter/foundation.dart';

@immutable
class DetalheBoletoUnidadeEntity {
  final int ano;
  final int boleto;
  final String cep;
  final String cgcpro;
  final String cidade;
  final String codced;
  final int codcon;
  final int codgru;
  final String codigoBarras;
  final String codimo;
  final int codord;
  final String coMensagemAberto;
  final DateTime datDes;
  final DateTime datEmi;
  final DateTime datVen;
  final DateTime datVenUtil;
  final int dia;
  final int diasAtraso;
  final String documento;
  final String dvCodced;
  final String endCob;
  final String endereco;
  final String estado;
  final int exibirCoMensagemAberto;
  final int faturaIdTitulo;
  final String histor;
  final int id;
  final int idConta;
  final int idTitulo;
  final String identificador;
  final String linhaDigitavel;
  final String linkBoleto;
  final int mes;
  final String mesAno;
  final String nomcom;
  final String nome;
  final String nossoNumero;
  final String nossoNumeroDV;
  final int ord;
  final String rowNumber;
  final String status;
  final int statusId;
  final String titcob;
  final double valDesBoleto;
  final double valMen;
  final double valTot;
  final int validadeSite;
  final double valTot_;

  const DetalheBoletoUnidadeEntity(
      {this.ano,
      this.boleto,
      this.cep,
      this.cgcpro,
      this.cidade,
      this.coMensagemAberto,
      this.codced,
      this.codcon,
      this.codgru,
      this.codigoBarras,
      this.codimo,
      this.codord,
      this.datDes,
      this.datEmi,
      this.datVen,
      this.datVenUtil,
      this.dia,
      this.diasAtraso,
      this.documento,
      this.dvCodced,
      this.endCob,
      this.endereco,
      this.estado,
      this.exibirCoMensagemAberto,
      this.faturaIdTitulo,
      this.histor,
      this.id,
      this.idConta,
      this.idTitulo,
      this.identificador,
      this.linhaDigitavel,
      this.linkBoleto,
      this.mes,
      this.mesAno,
      this.nomcom,
      this.nome,
      this.nossoNumero,
      this.nossoNumeroDV,
      this.ord,
      this.rowNumber,
      this.status,
      this.statusId,
      this.titcob,
      this.valDesBoleto,
      this.valMen,
      this.valTot,
      this.valTot_,
      this.validadeSite,
      });

  // @override
  // String toString() {
  //   return 'DetalhesBoletoUnidade(conts: $conts)';
  // }
}
