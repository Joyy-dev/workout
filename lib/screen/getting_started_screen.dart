import 'package:flutter/material.dart';
import 'package:workout/widgets/curved_arc.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      CustomPaint(
                        size: Size(double.infinity, 230),
                        painter: CurvedArc(),
                      ),
                      CustomPaint(
                        size: Size(double.infinity, 230),
                        painter: CurvedArc(),
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/images/gym.png',
                    width: double.infinity,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Stay on Top of Your Health',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ), textAlign: TextAlign.center,
                  ),
                  Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF12005F),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF12005F),
                        foregroundColor: Colors.white
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                    ),
                    Row(
                      children: [
                        Icon(Icons.chevron_right_outlined, color: Colors.white,),
                        Icon(Icons.chevron_right_outlined, color: Colors.white,)
                      ],
                    )
                  ],
                ),
              )],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CurvedArc extends CustomPainter {

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//     ..color = Color(0xFF12005F)
//     ..style = PaintingStyle.fill;

//    final center = Offset(size.width / 2, 0);

//     final outerRect = Rect.fromCircle(center: center, radius: size.width * 1.2);
//     final outerPath = Path()
//       ..addArc(outerRect, 3.14, 3.14); // 180° arc
//     canvas.drawPath(outerPath, paint);

//     final innerRect =
//       Rect.fromCircle(
//         center: center.translate(
//           0, 
//           size.height * 0.3
//         ), 
//         radius: size.width * 1.0
//       );
//     final innerPath = Path()
//     ..addArc(innerRect, 3.14, 3.14);
//     canvas.drawPath(innerPath, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }