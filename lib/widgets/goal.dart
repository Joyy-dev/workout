import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  const Goal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          //height: 200,
          width: 185,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Goal',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 5,),
              CircularProgressIndicator(
                value: 0.60,
                strokeCap: StrokeCap.round,
                backgroundColor: Color(0xFFC0C0C0),
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                  minWidth: 130,
                  minHeight: 130
                ),
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation(Color(0xFF12005F)),
              ),
              SizedBox(height: 5,),
              Text(
                'You\'re 60% closer to your goal. Keep pushing the finish line is near!'
              )
            ],
          ),
        ),
        Container(
          height: 290,
          width: 185,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text('Map'),
        )
      ],
    );
  }
}