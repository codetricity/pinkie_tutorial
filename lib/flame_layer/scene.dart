import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:pinkie_tutorial/blocs/level/level_cubit.dart';
import 'package:pinkie_tutorial/flame_layer/level.dart';

class Scene extends PositionComponent
    with FlameBlocListenable<LevelCubit, LevelState> {
  Level level1 = Level();
  Level level2 = Level();
  Level level3 = Level();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(level1);
  }

  @override
  void onNewState(LevelState state) {
    if (state.level == 2) {
      remove(level1);
      add(level2);
    }
    if (state.level == 3) {
      remove(level2);
      add(level3);
    }
    super.onNewState(state);
  }
}
