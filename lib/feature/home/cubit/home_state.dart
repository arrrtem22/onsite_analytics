part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.general({
    @Default([]) List<String> prompts,
  }) = _General;
}
