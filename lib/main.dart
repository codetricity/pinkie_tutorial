import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:pinkie_tutorial/flame_layer/flame_layer.dart';

import 'flutter_layer/flutter_layer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(const PinkieApp());
}

class PinkieApp extends StatelessWidget {
  const PinkieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.orange, fontSize: 24))),
      home: Scaffold(
          body: Stack(
        children: const [FlameLayer(), FlutterLayer()],
      )),
    );
  }
}
