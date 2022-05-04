import 'package:Gestart/domain/entities/setup/setup_reserva_entity.dart';

extension SetupReservaMapper on SetupReservaEntity {
  SetupReservaEntity copyWith({int maxIntRes}) {
    return SetupReservaEntity(
      maxIntRes: maxIntRes ?? this.maxIntRes,
    );
  }

  SetupReservaEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SetupReservaEntity(
      maxIntRes: map['MAX_INTRES'],
    );
  }
}
