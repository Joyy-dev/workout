import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/model/workout.dart';

class SuggestedWorkout extends StatelessWidget {
  const SuggestedWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    final exercise = Provider.of<Pleasure>(context);
    final woe = exercise.execise;
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: woe.length,
        itemBuilder: (context, index) {
          final gym = woe[index];
          return Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(gym.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(110, 0, 0, 0), 
                  BlendMode.darken
                )
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gym.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  gym.excerpt,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),
                ),
                SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF12005F),
                    foregroundColor: Colors.white
                  ),
                  child: Text(
                    'Start Workout'
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}