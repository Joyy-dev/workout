import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout/widgets/metrics.dart';
import 'package:workout/widgets/workout_chart.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  String extractFirstName(String email) {
    if (email.isEmpty) return 'User';
    String namePart = email.split('@')[0];
    namePart = namePart.split(RegExp(r'[._]'))[0];
    return namePart[0].toUpperCase() + namePart.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final user = snapshot.data!;
        final firstName = extractFirstName(user.email ?? '');
        return  Scaffold(
      backgroundColor: Color(0xFFD4D4D4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, $firstName!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          Text(
                            'Ready to crush your health goals today?',
                            style: TextStyle(
                              fontSize: 12
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white
                    ),
                    child: Icon(Icons.notifications_outlined),
                  )
                ],
              ),
              SizedBox(height: 20,),
              WorkoutChart(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Metrics',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  Text(
                    'see all'
                  )
                ],
              ),
              SizedBox(height: 15,),
              Metrics(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggested Workouts',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Text(
                    'See all'
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  });
  }
}