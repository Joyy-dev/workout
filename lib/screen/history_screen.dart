import 'package:flutter/material.dart';
import 'package:workout/widgets/distance.dart';
import 'package:workout/widgets/weekly.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history-screen';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4D4D4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step',
                style: TextStyle(
                  fontSize: 26
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Walk & Run Activity',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(
                    Icons.directions_run_outlined, 
                    color: Color(0xFF12005F),
                    size: 35,
                  ),
                  Text(
                    '8792',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    'Steps',
                    style: TextStyle(
                      fontSize: 14
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Weekly(),
              SizedBox(height: 20,),
              Distance()
            ],
          ),
        ),
      ),
    );
  }
}