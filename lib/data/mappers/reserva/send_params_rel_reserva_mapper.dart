import 'package:Gestart/domain/entities/reserva/reserva_entity.dart';
import 'package:Gestart/domain/entities/reserva/send_params_rel_reserva_entity.dart';

extension SendParamsRelReserva on SendParamsRelReservaEntity {
  SendParamsRelReservaEntity copyWith(
      {int status,
      int codCon,
      String codimo,
      String espaco,
      String dataIni,
      String dataFim}) {
    return SendParamsRelReservaEntity(
      status: status ?? this.status,
      codCon: codCon ?? this.codCon,
      codimo: codimo ?? this.codimo,
      espaco: espaco ?? this.espaco,
      dataIni: dataIni ?? this.dataIni,
      dataFim: dataFim ?? this.dataFim,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "CODCON": codCon,
      "CODIMO": codimo,
      "ESPACO_ID": espaco,
      "STATUS": status,
      "DATINI": dataIni,
      "DATFIM": dataFim,
      "TIPO": tipo,
    };
  }
}
