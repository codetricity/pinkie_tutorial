import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:pinkie_tutorial/actors/pinkie.dart';
import 'package:pinkie_tutorial/actors/treasure.dart';
import 'package:pinkie_tutorial/blocs/level/level_cubit.dart';

import 'pinkie_game.dart';

class Level extends PositionComponent
    with HasGameRef<PinkieGame>, FlameBlocListenable<LevelCubit, LevelState> {
  Future<void> loadComponents(Sprite backgroundSprite) async {
    add(SpriteComponent(sprite: backgroundSprite, size: gameRef.size));

    for (int i = 0; i < 5; i++) {
      add(
        Treasure(
          treasurePosition: Vector2(
            (Random().nextInt(7000) + 2000) * gameRef.size[0] / 10000,
            (Random().nextInt(7000) + 2000) * gameRef.size[1] / 10000,
          ),
        ),
      );
    }
    add(Pinkie());
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (gameRef.levelCubit.state.level == 1) {
      loadComponents(await gameRef.loadSprite('background.png'));
    }
    if (gameRef.levelCubit.state.level == 2) {
      loadComponents(await gameRef.loadSprite('background2.png'));
    }
    if (gameRef.levelCubit.state.level == 3) {
      loadComponents(await gameRef.loadSprite('background3.png'));
    }
  }
}
