
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompts_state.freezed.dart';
part 'prompts_state.g.dart';


@freezed
class PromptsState with _$PromptsState {
  const factory PromptsState({
    @Default([]) List<String> prompts,
  }) = _PromptsState;

  factory PromptsState.fromJson(Map<String, Object?> json) =>
      _$PromptsStateFromJson(json);
}