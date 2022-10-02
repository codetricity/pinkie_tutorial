import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'scene.dart';
import 'package:flame/palette.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pinkie_tutorial/actors/pinkie.dart';
import 'package:pinkie_tutorial/blocs/level/level_cubit.dart';
import 'package:pinkie_tutorial/blocs/score/score_bloc.dart';
import 'dart:ui';

import '../actors/treasure.dart';

class PinkieGame extends FlameGame with HasCollisionDetection, HasDraggables {
  final ScoreBloc scoreBloc;
  final LevelCubit levelCubit;

  PinkieGame({required this.scoreBloc, required this.levelCubit});

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

    add(FlameMultiBlocProvider(
      providers: [
        FlameBlocProvider<ScoreBloc, ScoreState>.value(value: scoreBloc),
        FlameBlocProvider<LevelCubit, LevelState>.value(value: levelCubit),
      ],
      children: [
        Scene(),
      ],
    ));

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
