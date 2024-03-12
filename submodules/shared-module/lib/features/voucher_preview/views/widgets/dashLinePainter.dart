import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final double parentHeight;

  DashedLinePainter(this.parentHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE04F16)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 10;
    const dashSpace = 2;
    double startY = 0;

    while (startY < parentHeight) {
      canvas.drawLine(Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}