import 'dart:async';
import 'package:Gestart/domain/utils/app_exception.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:flutter/foundation.dart';

@immutable
class ResourceData<T> {
  final Status status;
  final T data;
  final String message;
  final AppException error;

  static AppException Function(dynamic e) _errorMapper =
      (e) => AppException(exception: e, message: e.toString());

  const ResourceData(
      {this.data, @required this.status, this.message, this.error});

  static void setErrorMapper(AppException Function(dynamic e) errorMapper) {
    _errorMapper = errorMapper;
  }

  ResourceData<O> transformData<O>(
    O Function(T data) transformData,
  ) =>
      ResourceData<O>(
        data: transformData(data),
        status: status,
        error: error,
        message: message,
      );

  ResourceData<T> mergeStatus(ResourceData other) {
    if (other == null) {
      return this;
    }
    if (status == other.status) {
      return this;
    } else if (status == Status.failed) {
      return this;
    } else if (other.status == Status.failed) {
      return other.transformData<T>((data) => this.data);
    } else if (status == Status.loading) {
      return this;
    } else {
      return other.transformData<T>((data) => this.data);
    }
  }

  static ResourceData<T> loading<T>({T data}) =>
      ResourceData<T>(data: data, status: Status.loading);

  static ResourceData<T> failed<T>({dynamic error, T data}) {
    final _error = _errorMapper(error);
    return ResourceData<T>(
      error: _error,
      data: data,
      status: Status.failed,
      message: _error?.message,
    );
  }

  static ResourceData<T> success<T>({T data}) =>
      ResourceData<T>(data: data, status: Status.success);

  static FutureOr<ResourceData<T>> asFuture<T>(
      FutureOr<T> Function() req) async {
    try {
      final res = await req();
      return success<T>(data: res);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final _errorMapped = _errorMapper(e);
      debugPrint(e.toString());
      return failed(
        error: _errorMapped,
        data: _errorMapped?.data is T ? _errorMapped?.data : null,
      );
    }
  }

  static ResourceData<T> asRequest<T>(T Function() req) {
    try {
      final res = req();
      return success<T>(data: res);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final _errorMapped = _errorMapper(e);
      debugPrint(e.toString());
      return failed(
        error: _errorMapped,
        data: _errorMapped?.data is T ? _errorMapped?.data : null,
      );
    }
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResourceData<T> &&
        o.status == status &&
        o.data == data &&
        o.message == message &&
        o.error == error;
  }

  @override
  int get hashCode {
    return status.hashCode ^ data.hashCode ^ message.hashCode ^ error.hashCode;
  }
}
