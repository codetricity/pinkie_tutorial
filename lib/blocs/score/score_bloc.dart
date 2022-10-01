import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinkie_tutorial/blocs/level/level_cubit.dart';

part 'score_event.dart';
part 'score_state.dart';

enum GemType { red, pink, green }

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  final LevelCubit levelCubit;
  ScoreBloc({required this.levelCubit}) : super(ScoreState.initial()) {
    on<IncreaseScoreEvent>((event, emit) {
      emit(state.copyWith(score: state.score + 1));
      if (state.score % 5 == 0) {
        levelCubit.increaseLevel();
      }
    });
    on<ChangeGemScoreEvent>((event, emit) {
      emit(state.copyWith(gemType: event.gemType));
    });
  }
}
