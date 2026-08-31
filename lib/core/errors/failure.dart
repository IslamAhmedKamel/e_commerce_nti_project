//
import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioEx(DioException dioEx) {
    switch (dioEx.type) {
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(json: dioEx.response!);
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "sendTimeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "receiveTimeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "badCertificate");
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "cancel");
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: "No Internet Connection ,please try later",
        );
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "unknown");
      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: "transformTimeout");
    }
  }
  factory ServerFailure.fromBadResponse({required Response<dynamic> json}) {
    if (json.statusCode == 400 ||
        json.statusCode == 401 ||
        json.statusCode == 409) {
      return ServerFailure(
        errorMessage: json.data["message"] ?? "Unknown error",
      );
    }

    if (json.statusCode == 500) {
      return ServerFailure(errorMessage: "فيه مشكلة في السيرفر");
    }

    if (json.statusCode == 404) {
      return ServerFailure(errorMessage: "الصفحة غير موجودة");
    }

    return ServerFailure(errorMessage: "There was an error, please try again");
  }
}
