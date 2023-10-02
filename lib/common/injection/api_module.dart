// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';
import 'package:onsite_analytics/common/network/interceptor/auth_interceptor.dart';

@module
abstract class ApiModule {
  Dio dio(
    AuthInterceptor authInterceptor,
    BaseInterceptor baseInterceptor,
    LoggerInterceptor logInterceptor,
    ErrorInterceptor errorInterceptor,
  ) =>
      NetworkManager.getApiDioClient(
        baseUrl: Uri.parse(AppConstants.baseUrl),
        interceptors: [
          authInterceptor,
          baseInterceptor,
          logInterceptor,
          errorInterceptor,
        ],
      );
}
