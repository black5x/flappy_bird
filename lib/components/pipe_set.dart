import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_game/main.dart';

class PipeSet extends Component{

  static double pipeH = size.height / 12 *7;
  static double pipeW = pipeH /160 * 26;
  static double pipeGap = 4;

  Sprite _pipeUp = Sprite("pipe_up.png");
  Sprite _pipeDown = Sprite("pipe_down.png");

  double pipePos = size.width;



  @override
  void render(Canvas c) {
    _pipeUp.renderPosition(c, Position(size.width/2, pipeH/7*-6)
    , size:Position(pipeW, pipeH));

    _pipeDown.renderPosition(c, Position(size.width/2, pipeH/7*5)
        , size:Position(pipeW, pipeH));
  }

  @override
  void update(double t) {
    pipePos -= t * 50;

  }


}