import 'package:Gestart/domain/utils/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ErrorMapper {
  static AppException from(e) {
    try {
      debugPrintStack(stackTrace: e.stackTrace);
    } catch (e) {}
    switch (e.runtimeType) {
      case AppException:
        return e;
      case DioError:
        return AppException(
          exception: e,
          message: _dioError(e),
        );

      default:
        return AppException(
          exception: e,
          message: e.toString(),
        );
    }
  }

  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        return "Falha na conexão";
        break;
      case DioErrorType.cancel:
        return "Requisição cancelada";
        break;
      case DioErrorType.response:
      case DioErrorType.other:
      default:
        break;
    }
    if (error.response?.statusCode != null) {
      switch (error.response.statusCode) {
        case 401:
          return error.response.data["error"][0];
          break;
        case 403:
          return "Ocorreu um erro na requisição";
          break;
        case 404:
          return error.response.data["error"][0];
          break;
        case 400:
          return error.response.data["error"][0];
          break;
        case 500:
          return "Erro no serviço, tente mais tarde.";
          break;
        case 503:
          return "Serviço indisponível, tente mais tarde.";
          break;
        default:
      }
    }
    return "Ocorreu um erro na solicitação, tente novamente mais tarde.";
  }
}
