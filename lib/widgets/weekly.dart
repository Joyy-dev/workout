import 'package:flutter/material.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  int selectedIndex = 0;

  List<String> week = [
    '1 Week',
    '2 Week',
    '3 Week',
    '1 Month'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(week.length, (index) {
        bool isSelected = selectedIndex == index;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          margin: EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected ? Color(0xFF12005F) : Color(0xFFEEEEFC)
          ),
          child: Text(
            week[index],
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black
            ),
          ),
        );
      }),
    );
  }
}