import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioExcepton) {
    switch (dioExcepton.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('ConnectionTimeout , Try agian!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('SendTimeout , Try agian!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('ReceiveTimeout , Try agian!');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate , Try agian!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExcepton.response!.statusCode!, dioExcepton.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown Error , Try again later!');
      default:
        return ServerFailure('Opps , Try again later!');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure('Error 404 , Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Server Error , Try again later!');
    } else {
      return ServerFailure('Opps , Try again later!');
    }
  }
}
