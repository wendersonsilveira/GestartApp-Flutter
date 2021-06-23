class AppException<E> implements Exception {
  final String message;
  final E exception;
  final dynamic data;

  AppException({
    this.message = '',
    this.exception,
    this.data,
  });

  @override
  String toString() => message;
}
