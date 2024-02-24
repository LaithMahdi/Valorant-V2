import 'package:flutter/material.dart';

class RoundedDiagonalBorderPainter extends CustomPainter {
  final Gradient gradient;

  RoundedDiagonalBorderPainter({required this.gradient});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var roundnessFactor = 10.0;
    var equalization = 2.0;
    var path = Path();

    path.moveTo(0, roundnessFactor);
    path.lineTo(0, size.height - roundnessFactor);

    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);

    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);

    path.lineTo(size.width, _getY(size.width) + roundnessFactor - equalization);
    path.quadraticBezierTo(
        size.width,
        _getY(size.width),
        size.width - roundnessFactor + equalization,
        _getY(size.width - roundnessFactor + equalization));

    path.lineTo(
        roundnessFactor + equalization, _getY(roundnessFactor + equalization));
    path.quadraticBezierTo(0, 0, 0, roundnessFactor + equalization);

    canvas.drawPath(path, paint);
  }

  double _getY(double x) {
    return x * 0.2;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
