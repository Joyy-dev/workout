import 'package:flutter/material.dart';
import 'package:workout/auth/auth.dart';
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
        child: SingleChildScrollView(
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
                    'assets/images/man.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Stay on Top of Your Health',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold
                    ), textAlign: TextAlign.center,
                  ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => Auth())
                          );
                        }, 
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
                          Transform.translate(
                            offset: Offset(-13, 0),
                            child: Icon(
                              Icons.chevron_right_outlined, 
                              color: Colors.white,
                            )
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],),
            ],
          ),
        ),
      ),
    );
  }
}