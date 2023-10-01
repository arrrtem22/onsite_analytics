import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'non_home_cubit.freezed.dart';
part 'non_home_state.dart';

@injectable
class NonHomeCubit extends Cubit<NonHomeState> {
  NonHomeCubit() : super(const NonHomeState.loading());

  void init() {

  }
}
