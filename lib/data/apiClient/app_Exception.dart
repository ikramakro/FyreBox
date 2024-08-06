class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised Request: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Error: ');
}

class TimeoutException extends AppException {
  TimeoutException([String? message]) : super(message, 'Request Timeout: ');
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'No Internet: ');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Not Found: ');
}

class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, 'Conflict: ');
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message])
      : super(message, 'Internal Server Error: ');
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message])
      : super(message, 'Service Unavailable: ');
}

class GatewayTimeoutException extends AppException {
  GatewayTimeoutException([String? message])
      : super(message, 'Gateway Timeout: ');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'Forbidden: ');
}
