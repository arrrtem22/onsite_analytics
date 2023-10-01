import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';

@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[AppHttpHeaders.authorization] =
        '${AppConstants.authorizationPrefix} ${AppConstants.accessKey}';
    handler.next(options);
  }
}
