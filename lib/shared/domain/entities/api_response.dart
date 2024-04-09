import 'api_exception.dart';

final class ApiResponse<T> {
  const ApiResponse({this.data, this.exception});

  final T? data;
  final ApiException? exception;
}
