
import 'package:Gestart/domain/entities/reserva/relatorio_reserva_entity.dart';

extension RelatorioReservaMapper on RelatorioReservaEntity {

  Map<String, dynamic> toMap() {
    return {
      'CODCON': codcon,
      'DATINI': datini,
      'DATFIM': datfim,
      'STATUS': status,
    };
  }
}
