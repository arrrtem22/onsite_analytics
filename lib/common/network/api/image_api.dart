import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';
import 'package:retrofit/http.dart';

part 'image_api.g.dart';

@RestApi()
@injectable
abstract class ImageApi {
  @factoryMethod
  factory ImageApi(Dio dio) =>
      /*FakeApi.account.isEnabled*/ false ? _FakeImageApi() : _ImageApi(dio);

  @GET('/photos/random')
  Future<ImageResponse> getImage();
}

class _FakeImageApi implements ImageApi {
  @override
  Future<ImageResponse> getImage() {
    // TODO: implement getAccount
    throw UnimplementedError();
  }
}
