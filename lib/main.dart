import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flappy_game/my_game.dart';

Size size;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  size = await Flame.util.initialDimensions();

  runApp(MyGame().widget);
}

