import 'package:flutter/material.dart';

class CurvedArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF13007C), 
          Color(0xFF000057),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(0, size.height * 0.1);
    path1.quadraticBezierTo(
      size.width / 2,
      -size.height * 0.1,
      size.width,
      size.height * 0.1,
    );
    path1.lineTo(size.width, size.height * 0.25);
    path1.quadraticBezierTo(
      size.width / 2,
      0,
      0,
      size.height * 0.25,
    );
    path1.close();
    canvas.drawPath(path1, paint);

    // Draw second arc
    final path2 = Path();
    path2.moveTo(0, size.height * 0.25);
    path2.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height * 0.25,
    );
    path2.lineTo(size.width, size.height * 0.4);
    path2.quadraticBezierTo(
      size.width / 2,
      size.height * 0.15,
      0,
      size.height * 0.4,
    );
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
