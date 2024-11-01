import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';

class DioErrorHandler {
  static Either<FailureResponse, T> handle<T>(DioException e) {
    return Left(_mapErrorToFailure(e));
  }

  static FailureResponse _mapErrorToFailure(DioException e) {
    String errorMessage;
    String? defaultMessage = e.response?.data["error"];
    switch (e.type) {
      case DioExceptionType.connectionError:
        errorMessage = defaultMessage ?? "Connection timeout. Please try again.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = defaultMessage ?? "Send timeout. Please try again.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = defaultMessage ?? "Receive timeout. Please try again.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = defaultMessage ?? "Received invalid status code: ${e.response?.statusCode}";
        break;
      case DioExceptionType.cancel:
        errorMessage = defaultMessage ?? "Request was cancelled.";
        break;
      case DioExceptionType.unknown:
        errorMessage = defaultMessage ?? "Unexpected error occurred: ${e.message}";
        break;
      default:
        errorMessage = defaultMessage ?? "An unknown error occurred.";
        break;
    }

    return FailureResponse(errorMessage: errorMessage);
  }
}
