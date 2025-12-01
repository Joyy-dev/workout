import 'package:flutter/widgets.dart';
import 'package:workout/model/workoutactivity.dart';

class WorkoutActivityProvider with ChangeNotifier{
  final List<Workoutactivity> _activityData = [
    Workoutactivity(
      title: 'Around Park', 
      distance: 1.5, 
      date: DateTime(2025, 9, 11), 
      step: 2500, 
      bpm: 92, 
      timeRange: '6.20 AM - 8.40 AM'
    ),
    Workoutactivity(
      title: 'Commute To Office', 
      distance: 1.8, 
      date: DateTime(2025, 9, 11), 
      step: 2400, 
      bpm: 92, 
      timeRange: '6.20 AM - 8.40 AM'
    )
  ];

  List<Workoutactivity> get activity {
    return [..._activityData];
  }
}