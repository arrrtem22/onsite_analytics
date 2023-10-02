part of 'non_home_cubit.dart';

@freezed
class NonHomeState with _$NonHomeState {
  const factory NonHomeState.loading() = _Loading;

  const factory NonHomeState.general({required String imageUrl}) = _General;

  const factory NonHomeState.failure() = _Failure;
}
