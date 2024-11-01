import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';

class DioErrorHandler {
  static Either<FailureResponse, T> handle<T>(DioException e) {
    return Left(_mapErrorToFailure(e));
  }

  static FailureResponse _mapErrorToFailure(DioException e) {
    String errorMessage;

    switch (e.type) {
      case DioExceptionType.connectionError:
        errorMessage = "Connection timeout. Please try again.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Send timeout. Please try again.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive timeout. Please try again.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = "Received invalid status code: ${e.response?.statusCode}";
        break;
      case DioExceptionType.cancel:
        errorMessage = "Request was cancelled.";
        break;
      case DioExceptionType.unknown:
        errorMessage = "Unexpected error occurred: ${e.message}";
        break;
      default:
        errorMessage = "An unknown error occurred.";
        break;
    }

    return FailureResponse(errorMessage: errorMessage);
  }
}
