class BaseException implements Exception {
  final String message;

  BaseException(this.message);

  @override
  String toString() => message;
}

class DataSourceFailure extends BaseException {
  DataSourceFailure({String message = 'Erro na consulta'}) : super(message);
}

class InvalidParametersFailure extends BaseException {
  InvalidParametersFailure({String message = 'Parâmetros inválidos'})
      : super(message);
}

class EmptyParametersFailure extends BaseException {
  EmptyParametersFailure({required String message}) : super(message);
}

class ServerFailure extends BaseException {
  ServerFailure({required String message}) : super(message);
}

class FileFailure extends BaseException {
  FileFailure({required String message}) : super(message);
}

class DataSourceError extends BaseException {
  DataSourceError({required String message}) : super(message);
}

class NetworkFailure extends BaseException {
  NetworkFailure({String message = 'Erro de rede'}) : super(message);
}

class UnauthorizedFailure extends BaseException {
  UnauthorizedFailure({String message = 'Não autorizado'}) : super(message);
}

class NotFoundFailure extends BaseException {
  NotFoundFailure({String message = 'Não encontrado'}) : super(message);
}

class CacheFailure extends BaseException {
  CacheFailure({String message = 'Erro de cache'}) : super(message);
}

class UnknownFailure extends BaseException {
  UnknownFailure({String message = 'Erro desconhecido'}) : super(message);
}
