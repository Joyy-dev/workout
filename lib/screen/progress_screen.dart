import 'package:flutter/material.dart';
import 'package:workout/widgets/goal.dart';
import 'package:workout/widgets/weekly_summary.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4D4D4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: TextStyle(
                        fontSize: 19
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.share_outlined
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.only(
                    top: 25,
                    bottom: 25,
                    left: 15,
                    right: 180
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/active.png'
                      ),
                      fit: BoxFit.cover, 
                      colorFilter: ColorFilter.mode(
                        const Color.fromARGB(157, 0, 0, 0), 
                        BlendMode.darken
                      )
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stay Active!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        'See your steps and progress this week.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'View Summary'
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xFF12005F),
                              child: Icon(
                                Icons.arrow_outward,
                                color: Colors.white,
                              )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'This Week\'s Summary',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    Text(
                      'See all'
                    )
                  ],
                ),
                SizedBox(height: 10,),
                WeeklySummary(),
                SizedBox(height: 15,),
                Goal()
              ],
            ),
          ),
        ),
      ),
    );
  }
}