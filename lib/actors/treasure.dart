import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:pinkie_tutorial/actors/pinkie.dart';
import 'package:pinkie_tutorial/blocs/score/score_bloc.dart';
import 'package:pinkie_tutorial/flame_layer/pinkie_game.dart';

class Treasure extends SpriteAnimationComponent
    with
        HasGameRef<PinkieGame>,
        CollisionCallbacks,
        FlameBlocListenable<ScoreBloc, ScoreState> {
  final Vector2 treasurePosition;
  Treasure({required this.treasurePosition})
      : super(position: treasurePosition, size: Vector2.all(100)) {
    debugMode = true;
  }

  // late Sprite redGem;
  // late Sprite pinkGem;
  // late Sprite greenGem;

  late SpriteAnimation redGemAnimation;
  late SpriteAnimation pinkGemAnimation;
  late SpriteAnimation greenGemAnimation;

  Future<List<Sprite>> loadGemSprites(GemType gemType) async {
    List<Sprite> sprites = [];
    String spriteFileName = '';
    switch (gemType) {
      case GemType.red:
        spriteFileName = 'gems/red';
        break;
      case GemType.pink:
        spriteFileName = 'gems/pink';
        break;
      case GemType.green:
        spriteFileName = 'gems/green';
        break;
    }

    for (int i = 1; i < 61; i++) {
      if (i < 10) {
        sprites.add(await Sprite.load('$spriteFileName/000$i.png'));
      } else {
        sprites.add(await Sprite.load('$spriteFileName/00$i.png'));
      }
    }
    return sprites;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());

    redGemAnimation = SpriteAnimation.spriteList(
        await loadGemSprites(GemType.red),
        stepTime: 0.1);
    pinkGemAnimation = SpriteAnimation.spriteList(
        await loadGemSprites(GemType.pink),
        stepTime: 0.1);
    greenGemAnimation = SpriteAnimation.spriteList(
        await loadGemSprites(GemType.green),
        stepTime: 0.1);

    // redGem = await gameRef.loadSprite('red_gem.png');
    // pinkGem = await gameRef.loadSprite('pink_gem.png');
    // greenGem = await gameRef.loadSprite('green_gem.png');

    // sprite = redGem;
    animation = redGemAnimation;
  }

  @override
  void onNewState(ScoreState state) {
    switch (state.gemType) {
      case GemType.pink:
        animation = pinkGemAnimation;
        // sprite = pinkGem;
        break;
      case GemType.green:
        // sprite = greenGem;
        animation = greenGemAnimation;
        break;
      case GemType.red:
        // sprite = redGem;
        animation = redGemAnimation;
        break;
    }

    super.onNewState(state);
  }

  // @override
  // void update(double dt) {
  //   // x += 1;
  //   // y += 1;
  //   super.update(dt);
  // }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Pinkie) {
      print('there is a hit!');
      gameRef.scoreBloc.add(IncreaseScoreEvent());
      removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
