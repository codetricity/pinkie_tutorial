import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:pinkie_tutorial/actors/pinkie.dart';
import 'package:pinkie_tutorial/blocs/score/score_bloc.dart';

import '../actors/treasure.dart';

class PinkieGame extends FlameGame with HasCollisionDetection {
  final ScoreBloc scoreBloc;

  PinkieGame({required this.scoreBloc});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewport = FixedResolutionViewport(Vector2(1400, 784));
    add(SpriteComponent(sprite: await loadSprite('background.png'))
      ..size = size);

    add(FlameBlocProvider.value(value: scoreBloc, children: [
      Treasure(treasurePosition: Vector2(300, 100)),
      Treasure(treasurePosition: Vector2(600, 100)),
      Pinkie()
    ]));
  }
}
