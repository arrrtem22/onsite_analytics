// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({
    @JsonKey(fromJson: _parseImageUrl, name: 'urls') required String imageUrl,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, Object?> json) =>
      _$ImageResponseFromJson(json);
}

String _parseImageUrl(dynamic json) => json['full'] ?? '';
