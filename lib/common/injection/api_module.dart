// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';

@module
abstract class ApiModule {
  Dio dio(
    BaseInterceptor baseInterceptor,
    LoggerInterceptor logInterceptor,
    ErrorInterceptor errorInterceptor,
  ) =>
      NetworkManager.getApiDioClient(
        baseUrl: Uri.parse(AppConstants.baseUrl),
        interceptors: [
          baseInterceptor,
          logInterceptor,
          errorInterceptor,
        ],
      );
}
