import 'package:flutter/material.dart';
import 'package:workout/widgets/gender_checklist.dart';

class PhysicalActivityScreen extends StatelessWidget {
  const PhysicalActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Physical Activity'
        ),
        actions: [
          Icon(Icons.notification_add_outlined)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Gender',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15,),
            GenderChecklist()
          ],
        ),
      ),
    );
  }
}