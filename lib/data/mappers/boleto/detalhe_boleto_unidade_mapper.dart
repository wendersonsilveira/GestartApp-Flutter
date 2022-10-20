import 'package:Gestart/app/utils/ui_helper.dart';
import 'package:Gestart/domain/entities/boleto/detalhe_boleto_unidade_entity.dart';

extension DetalheBoletoUnidadeMapper on DetalheBoletoUnidadeEntity {

  List<DetalheBoletoUnidadeEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();


  DetalheBoletoUnidadeEntity fromMap(Map<String, dynamic> map) {
    if (map == null || map.length == 0) return null;

    return DetalheBoletoUnidadeEntity(
      ano: map['ANO'],
      boleto: map['BOLETO'],
      cep: map['CEP'],
      cgcpro: map['CGCPRO'],
      cidade: map['CIDADE'],
      codced: map['CODCED'],
      codcon: map['CODCON'],
      codgru: map['CODGRU'],
      codigoBarras: map['CODIGO_BARRAS'],
      codimo: map['CODIMO'],
      codord: map['CODORD'],
      coMensagemAberto: map['CO_MENSAGEM_EM_ABERTO'],
      datDes: map['DATDES'] != null ? DateTime.parse(map['DATDES'])  : null,
      datEmi: map['DATEMI'] != null ? DateTime.parse(map['DATEMI']) : null,
      datVen: map['DATVEN'] != null ? DateTime.parse(map['DATVEN']) : null,
      datVenUtil: map['DATVEN_UTIL'] != null ? DateTime.parse(map['DATVEN_UTIL']) : null,
      dia: map['DIA'],
      diasAtraso: map['DIAS_ATRASO'],
      documento: map['DOCUMENTO'],
      dvCodced: map['DV_CODCED'],
      endCob: map['ENDCOB'],
      endereco: map['ENDERECO'],
      estado: map['ESTADO'],
      exibirCoMensagemAberto: map['EXIBIR_CO_MENSAGEM_EM_ABERTO'],
      faturaIdTitulo: map['FATURA_ID_TITULO'],
      histor: map['HISTOR'],
      id: map['ID'],
      identificador: map['IDENTIFICADOR'],
      idConta: map['ID_CONTA'],
      idTitulo: map['ID_TITULO'],
      linhaDigitavel: map['LINHA_DIGITAVEL'],
      linkBoleto: map['LINK_BOLETO'],
      mes: map['MES'],
      mesAno: map['MESANO'],
      nomcom: map['NOMCON'],
      nome: map['NOME'],
      nossoNumero: map['NOSSO_NUMERO'],
      nossoNumeroDV: map['NOSSO_NUMERO_DV'],
      ord: map['ORD'],
      rowNumber: map['ROW_NUMBER'],
      status: map['STATUS'],
      statusId: map['STATUS_ID'],
      titcob: map['TITCOB'],
      valDesBoleto: map['VALDES_BOLETO']?.toDouble(),
      valMen: map['VALMEN']?.toDouble(),
      valTot: map['VALTOT']?.toDouble(),
      valTot_: map['VALTOT_']?.toDouble(),
      validadeSite: map['VALIDADESITE'],
    );
  }

}
