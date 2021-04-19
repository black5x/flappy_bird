import 'dart:ui';

import 'package:flame/game/base_game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_game/components/bird.dart';
import 'package:flappy_game/components/floor.dart';
import 'package:flappy_game/components/pipe_set.dart';
import 'package:flappy_game/components/titles.dart';
import 'package:flappy_game/game_state.dart';
import 'package:flappy_game/main.dart';
import 'package:flutter/cupertino.dart';


class MyGame extends BaseGame with TapDetector{

  Bird _bird;
  Floor _floor;
  PipeSet _pipeSet;
  Titles _titles;

  MyGame(){
    _bird = Bird();
    _floor = Floor();
    _titles = Titles();
    _pipeSet = PipeSet();



    this
      ..add(SpriteComponent.fromSprite(size.width, size.height, Sprite("bg.png")))
      ..add(_pipeSet)
      ..add(_bird)
      ..add(_floor)
      ..add(_titles);
  }

  @override
  void update(double t) {
    super.update(t);

    if(checkIf2CompoCollision(_bird.toRect(), _floor.toRect())){
      print("Game Over!!");
      gameState = GameState.gameover;
    }

  }

  @override
  void onTap() {
    _bird.onTap();
    switch(gameState){
      case GameState.pause:
        gameState = GameState.play;
        break;
      case GameState.play:
        break;
      case GameState.gameover:
        gameState = GameState.pause;
        break;
    }
  }

  bool checkIf2CompoCollision(Rect item1, Rect item2) {
    var intersectedRect = item1.intersect(item2);
    return intersectedRect.width > 2 && intersectedRect.height > 2;

  }


}

