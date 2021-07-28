import 'package:Gestart/domain/entities/recebimento/tipo_taxa_entity.dart';

extension TipoTaxaMapper on TipoTaxaEntity {
  TipoTaxaEntity copyWith({
    String tipTax,
    String desTax,
    int qtde,
  }) {
    return TipoTaxaEntity(
      tipTax: tipTax ?? this.tipTax,
      desTax: desTax ?? this.desTax,
      qtde: qtde ?? this.qtde,
    );
  }

  List<TipoTaxaEntity> fromMapList(List<dynamic> data) => List.from(data).map((element) => fromMap(element)).toList();

  TipoTaxaEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return TipoTaxaEntity(
      tipTax: map['TIPTAX'],
      desTax: map['DESTAX'],
      qtde: map['QTDE'],
    );
  }
}
