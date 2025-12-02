import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeeklySummary extends StatelessWidget {
  const WeeklySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 185,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Steps'
                      ),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(1),
                    title: Text(
                      '56,840',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF12005F)
                      ),
                    ),
                    subtitle: Text(
                      'Liters'
                    ),
                    trailing: Icon(
                      Icons.directions_run_outlined,
                      color: Color(0xFF12005F),
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              width: 185,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Calories'
                      ),
                      Icon(
                        Icons.more_horiz
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(1.0),
                    title: Text(
                      '2.9',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    subtitle: Text(
                      'Kcal'
                    ),
                    trailing: SvgPicture.asset(
                      'assets/svg/Fire.svg',
                      fit: BoxFit.cover,
                      width: 35,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 185,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Heart Rate'
                      ),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(1),
                    title: Text(
                      '76',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    subtitle: Text(
                      'Bpm'
                    ),
                    trailing: SvgPicture.asset(
                      'assets/svg/Vector.svg',
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              width: 185,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Workout'
                      ),
                      Icon(
                        Icons.more_horiz
                      )
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(1.0),
                    title: Text(
                      '3h 20m',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    subtitle: Text(
                      'Steady'
                    ),
                    trailing: Icon(
                      Icons.alarm,
                      color: Color(0xFF9CC15F),
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}