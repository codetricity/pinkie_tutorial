import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:pinkie_tutorial/actors/pinkie.dart';

class PinkieGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewport = FixedResolutionViewport(Vector2(1400, 784));
    add(SpriteComponent(sprite: await loadSprite('background.png'))
      ..size = size);
    add(Pinkie());
  }
}
