import 'package:flutter/material.dart';
import 'package:package_delivery/Constant/colors.dart';


class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint ()
    ..strokeWidth = 2
    ..isAntiAlias = true
    ..color = const Color(0x77cdb175); // brush color

    var max = size. width;
    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 0;
    final space = (dashSpace + dashWidth);

    while (startX < max) {
    canvas.drawLine(Offset(startX, 100.0), Offset(startX + dashWidth, 100.0), paint);
    startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DrawDottedhorizontalline extends CustomPainter {
  Paint? _paint;

  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint!.color = cBluewithOpacity;
    _paint!.strokeWidth = 2; //dots thickness
    _paint!.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint!);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = cBlue
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}