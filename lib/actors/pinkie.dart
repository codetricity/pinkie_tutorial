import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:pinkie_tutorial/flame_layer/pinkie_game.dart';

class Pinkie extends SpriteAnimationComponent with HasGameRef<PinkieGame> {
  Pinkie() : super(position: Vector2.all(100), size: Vector2.all(100)) {
    // debugMode = true;
  }

  double speed = 10.0;
  bool flipped = false;
  late final SpriteAnimation runAnimation;
  late final SpriteAnimation idleAnimation;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());

    // idle animation
    var idleData = SpriteAnimationData.sequenced(
        amount: 11, stepTime: 0.05, textureSize: Vector2.all(32));
    var idleImage = await Flame.images.load('pinkie_idle.png');
    idleAnimation = SpriteAnimation.fromFrameData(idleImage, idleData);

    // run animation
    var runData = SpriteAnimationData.sequenced(
        amount: 12, stepTime: 0.05, textureSize: Vector2.all(32));
    var runImage = await Flame.images.load('pinkie_run.png');
    runAnimation = SpriteAnimation.fromFrameData(runImage, runData);
    animation = runAnimation;
  }

  @override
  void update(double dt) {
    position.add(gameRef.joystick.delta * speed * dt);

    if (gameRef.joystick.delta[0] > -0.01 && gameRef.joystick.delta[0] < 0.01) {
      animation = idleAnimation;
    } else {
      animation = runAnimation;
    }

    if (gameRef.joystick.delta[0] < 0) {
      if (!flipped) {
        flipHorizontallyAroundCenter();
        flipped = true;
      }
    } else {
      if (flipped) {
        flipHorizontallyAroundCenter();
        flipped = false;
      }
    }
    super.update(dt);
  }
}
