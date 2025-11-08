import 'package:flutter/material.dart';
import 'package:workout/widgets/auth_draggable_scroll.dart';
import 'package:workout/widgets/curved_arc.dart';

class AuthScreens extends StatelessWidget {
  const AuthScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CustomPaint(
                  size: Size(double.infinity, 200),
                  painter: CurvedArc(),
                ),
                CustomPaint(
                  size: Size(double.infinity, 200),
                  painter: CurvedArc(),
                )
              ],
            ),
            Image.asset(
              'assets/images/man.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            AuthDraggableScroll()
          ],
        ),
      ),
    );
  }
}