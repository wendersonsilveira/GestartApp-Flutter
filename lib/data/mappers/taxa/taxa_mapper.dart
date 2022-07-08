import 'package:Gestart/domain/entities/taxa/taxa_entity.dart';

extension TaxaMapper on TaxaEntity {
  TaxaEntity copyWith({
    String tiptax,
    String destax,
  }) {
    return TaxaEntity(
      tiptax: tiptax ?? this.tiptax,
      destax: destax ?? this.destax,
    );
  }

  List<TaxaEntity> fromMapList(List<dynamic> data) =>
      List.from(data).map((element) => fromMap(element)).toList();

  TaxaEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TaxaEntity(tiptax: map['TIPTAX'], destax: map['DESTAX']);
  }
}
