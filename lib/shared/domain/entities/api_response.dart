import 'api_exception.dart';

sealed class ApiResponse<T> {
  const ApiResponse(this.data);

  final T data;
}

final class ApiSuccess<T> extends ApiResponse<T> {
  const ApiSuccess(super.data);
}

final class ApiFailure extends ApiResponse<ApiException> {
  const ApiFailure(super.data);
}
