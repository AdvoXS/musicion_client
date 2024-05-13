import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WavePainter extends CustomPainter {
  final Animation _animation;

  WavePainter(this._animation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        const Offset(1000, 1000),
        <Color>[
          const Color(0xff0baecf),
          const Color(0xff2bc451),
          const Color(0xff0699b6),
        ],
        [
          0.0,
          0.61,
          1,
        ],
      )
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, size.height);

    for (int i = 0; i <= 30; i++) {
      path.lineTo(i * size.width / 10,
          size.height / 5 + sin(_animation.value + i * pi / 15) * 80);
    }

    path.lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}