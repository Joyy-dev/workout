import 'package:flutter/material.dart';
import 'package:workout/widgets/age_drop_down.dart';
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
      backgroundColor: Color(0xFFD4D4D4),
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
                fontSize: 23,
              ),
            ),
            SizedBox(height: 15,),
            GenderChecklist(),
            SizedBox(height: 15),
            Text(
              'Select Age',
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            SizedBox(height: 15,),
            AgeDropDown(),
            SizedBox(height: 15,),
            Text(
              'Physical Details',
              style: TextStyle(
                fontSize: 23
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Height (Ft)',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        'Height',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weight (Kg)',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        'Weight',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}