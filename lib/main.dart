import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workout/firebase_options.dart';
import 'package:workout/screen/getting_started_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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