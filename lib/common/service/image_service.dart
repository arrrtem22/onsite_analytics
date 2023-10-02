import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';

@injectable
class ImageService {
  ImageService({
    required ImageApi imageApi,
  }) : _imageApi = imageApi;

  final ImageApi _imageApi;

  Future<ImageResponse> getImage() => _imageApi.getImage();
}
