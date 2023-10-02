import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';

part 'non_home_cubit.freezed.dart';
part 'non_home_state.dart';

@injectable
class NonHomeCubit extends Cubit<NonHomeState> {
  NonHomeCubit({required this.imageService})
      : super(const NonHomeState.loading());

  final ImageService imageService;

  void init() async {
    try {
      final imageResponse = await imageService.getImage();
      emit(NonHomeState.general(imageUrl: imageResponse.imageUrl));
    } catch (e) {
      emit(const NonHomeState.failure());
    }
  }
}
