import '../entities/api_response.dart';

abstract interface class UseCase<R, P> {
  Future<ApiResponse<R>> invoke(P params);
}
