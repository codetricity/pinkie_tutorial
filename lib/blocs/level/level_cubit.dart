import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(const LevelInitial());

  void increaseLevel() {
    emit(LevelIncreased(state.level + 1));
  }
}
