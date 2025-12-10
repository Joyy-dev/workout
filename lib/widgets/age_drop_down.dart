import 'package:flutter/material.dart';

  List<String> age = ['Select Your Age', '18', '19', '20', '21', '22', '23', '24', '25', 'above 25'];

class AgeDropDown extends StatefulWidget {
  const AgeDropDown({super.key});

  @override
  State<AgeDropDown> createState() => _AgeDropDownState();
}

class _AgeDropDownState extends State<AgeDropDown> {
  
  String selectedAge = age.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButton(
        value: selectedAge,
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        onChanged: (String? value) {
          setState(() {
            selectedAge = value!;
          });
        },
        items: age.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value
            )
          );
        }).toList()
      ),
    );
  }
}