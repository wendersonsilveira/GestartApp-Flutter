import 'package:Gestart/domain/entities/recebimento/send_params_rel_inadimplencia_entity.dart';

extension SendParamsRelInadimplencia on SendParamsRelInadimplenciaEntity {
  SendParamsRelInadimplenciaEntity copyWith({
    int codCon,
    String codImo,
    String tipTax,
    String tipCob,
    String datIni,
    String datFim,
  }) {
    return SendParamsRelInadimplenciaEntity(
      codCon: codCon ?? this.codCon,
      codImo: codImo ?? this.codImo,
      tipTax: tipTax ?? this.tipTax,
      tipCob: tipCob ?? this.tipCob,
      datIni: datIni ?? this.datIni,
      datFim: datFim ?? this.datFim,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "CODCON": codCon,
      "CODIMO": codImo,
      "TIPTAX": tipTax,
      "TIPCOB": tipCob,
      "DATINI": datIni,
      "DATFIM": datFim,
    };
  }
}
