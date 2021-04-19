import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flappy_game/my_game.dart';

Size size;
var spriteSheet;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  size = await Flame.util.initialDimensions();
  spriteSheet = await Flame.images.load("sprites.png");

  runApp(MyGame().widget);
}

