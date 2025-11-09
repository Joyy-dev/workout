import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Metrics extends StatelessWidget {
  const Metrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 110,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Water'
                  ),
                  Icon(Icons.water_drop, color: Color(0xFF12005F),)
                ],
              ),
              Row(
                children: [
                  Text(
                    '2.9',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Liters',
                    style: TextStyle(
                      fontSize: 13
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 10,),
        Container(
          height: 100,
          width: 120,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calories'
                  ),
                  SvgPicture.asset('assets/svg/Fire.svg')
                ],
              ),
              Row(
                children: [
                  Text(
                    '2.9',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Cal',
                    style: TextStyle(
                      fontSize: 13
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 10,),
        Container(
          height: 100,
          width: 130,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Heart Rate'
                  ),
                  SvgPicture.asset('assets/svg/Vector.svg')
                ],
              ),
              Row(
                children: [
                  Text(
                    '76',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Bpm',
                    style: TextStyle(
                      fontSize: 13
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}