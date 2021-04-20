import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_game/components/bird.dart';
import 'package:flappy_game/components/floor.dart';
import 'package:flappy_game/components/pipe_set.dart';
import 'package:flappy_game/components/score.dart';
import 'package:flappy_game/components/titles.dart';
import 'package:flappy_game/game_state.dart';
import 'package:flappy_game/main.dart';
import 'package:flutter/cupertino.dart';


class MyGame extends BaseGame with TapDetector{

  Bird _bird;
  Floor _floor;
  PipeSet _pipeSet;
  Titles _titles;
  Score _score;

  MyGame(){
    _bird = Bird();
    _floor = Floor();
    _titles = Titles();
    _pipeSet = PipeSet();
    _score = Score();



    this
      ..add(SpriteComponent.fromSprite(size.width, size.height, Sprite("bg.png")))
      ..add(_pipeSet)
      ..add(_bird)
      ..add(_floor)
      ..add(_titles)
      ..add(_score);
  }

  @override
  void update(double t) {
    super.update(t);

    if (gameState == GameState.play) {
      if (checkIf2CompoCollision(_bird.toRect(), _floor.toRect())) {
        setGameover();
      }

      if (checkIf2CompoCollision(_bird.toRect(), _pipeSet.getPipeDownRect())) {
        setGameover();
      }

      if (checkIf2CompoCollision(_bird.toRect(), _pipeSet.getPipeUpRect())) {
        setGameover();
      }

      checkIfBirdPassedPipe();
    }
  }

  void setGameover(){
    Flame.audio.play("hit.mp3");
    Flame.audio.play("die.mp3");
    gameState = GameState.gameover;


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
        _score.resetScore();
        break;
    }
  }

  bool checkIf2CompoCollision(Rect item1, Rect item2) {
    var intersectedRect = item1.intersect(item2);
    return intersectedRect.width > 2 && intersectedRect.height > 2;

  }

  void checkIfBirdPassedPipe(){
    if (_pipeSet.hadscored)
      return;

    if (_pipeSet.getPipeDownRect().right < _bird.toRect().left){
      Flame.audio.play("point.mp3");
      _score.addScore();

      _pipeSet.scoreUpdated();
    }

  }


}

