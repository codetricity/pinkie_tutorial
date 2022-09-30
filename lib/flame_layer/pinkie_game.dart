import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pinkie_tutorial/actors/pinkie.dart';
import 'package:pinkie_tutorial/blocs/score/score_bloc.dart';
import 'dart:ui';

import '../actors/treasure.dart';

class PinkieGame extends FlameGame with HasCollisionDetection, HasDraggables {
  final ScoreBloc scoreBloc;

  PinkieGame({required this.scoreBloc});

  late JoystickComponent joystick;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    var physicalSize = window.physicalSize;
    camera.viewport = FixedResolutionViewport(
        Vector2(physicalSize.width, physicalSize.height));
    // camera.viewport = FixedResolutionViewport(Vector2(1400, 832));
    add(SpriteComponent(sprite: await loadSprite('background.png'))
      ..size = size);

    add(FlameBlocProvider<ScoreBloc, ScoreState>.value(
        value: scoreBloc,
        children: [
          Treasure(treasurePosition: Vector2(300, 100)),
          Treasure(treasurePosition: Vector2(600, 100)),
          Treasure(treasurePosition: Vector2(500, 400)),
          Treasure(treasurePosition: Vector2(800, 500)),
          Pinkie()
        ]));

    final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 30, paint: knobPaint),
      background: CircleComponent(radius: 100, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);
  }
}
