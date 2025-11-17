import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history-screen';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4D4D4),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Step',
              style: TextStyle(
                fontSize: 26
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Walk & Run Activity'
            )
          ],
        ),
      ),
    );
  }
}