import 'package:flutter/material.dart';

class Workout {
  final String id;
  final String title;
  final String excerpt;
  final String image;

  Workout({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.image
  });
}
class pleasure with ChangeNotifier {
    final List<Workout> _excercise = [
      Workout(
        id: '01', 
    title: 'Running', 
    excerpt: 'Great cardio exercise that boosts endurance, burns calories, and strengthens the lower body.',
    image: 'assets/images/run.png'
  ),
  Workout(
    id: '02', 
    title: 'Walking', 
    excerpt: 'Low-impact workout that improves cardiovascular health and is easy for all fitness levels.',
    image: 'assets/images/walk.png'
  ),
  Workout(
    id: '03', 
    title: 'Swimming', 
    excerpt: 'Full-body workout that builds strength, endurance, and flexibility while being gentle on joints.',
    image: 'assets/images/swim.png'
  ),
  Workout(
    id: '04', 
    title: 'Cycling', 
    excerpt: 'Excellent for building leg strength and stamina while improving heart health.',
    image: 'assets/images/cycle.png'
  ),
  Workout(
    id: '05', 
    title: 'Hiking', 
    excerpt: 'Combines cardio and strength benefits with the added bonus of outdoor adventure.',
    image: 'assets/images/hike.png'
  ),
  Workout(
    id: '06', 
    title: 'Dancing', 
    excerpt: 'Fun way to burn calories, improve coordination, and enhance mood through movement.',
    image: 'assets/images/dance.png'
  )
];

List<Workout> get execise {
  return[..._excercise];
}
}
