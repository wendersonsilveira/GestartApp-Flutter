import 'package:Gestart/domain/entities/setup/setup_entity.dart';
import 'package:Gestart/domain/entities/setup/setup_reserva_entity.dart';
import 'package:Gestart/data/mappers/setup/setup_reserva_mapper.dart';

extension SetupMapper on SetupEntity {
  SetupEntity copyWith({
    int versaoSetup,
    SetupReservaEntity setupReserva,
    String iosStoreVersion,
    String androidStoreVersion,
    int forceUpdate


  }) {
    return SetupEntity(
      versaoArquivos: versaoArquivos ?? this.versaoArquivos,
      setupReserva: setupReserva ?? this.setupReserva,
    );
  }

  SetupEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SetupEntity(
      versaoArquivos: map['versao_arquivos'],
      setupReserva: SetupReservaEntity().fromMap(map['reserva_espaco']),
      iosStoreVersion: map['VERSAO_APP_IOS'],
      androidStoreVersion: map['VERSAO_APP_ANDROID'],
      forceUpdate: map['FORCAR_ATUALIZACAO']
    );
  }
}
