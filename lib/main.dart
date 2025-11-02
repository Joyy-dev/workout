import 'package:flutter/material.dart';
import 'package:workout/screen/getting_started_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkOut App',
      color: Colors.white,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: GettingStartedScreen(),
    );
  }
}