import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';

part 'home_cubit.freezed.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.promptsService}) : super(const HomeState.general());

  final PromptsService promptsService;

  StreamSubscription? _subscription;

  void init() {
    _subscription ??= promptsService.prompts().listen((List<String> prompts) {
      emit(HomeState.general(prompts: prompts));
    });
  }

  void navigate(String pageName) {
    if (pageName.isEmpty) {
      emit(HomeState.failure(
        prompts: state.prompts,
        type: FailureType.emptyTextField,
      ));
      return;
    }
    promptsService.addPrompt(pageName);
    emit(HomeState.navigate(
      prompts: state.prompts,
      pageName: pageName,
    ));
  }
}
