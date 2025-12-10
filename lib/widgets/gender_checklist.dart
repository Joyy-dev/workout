import 'package:flutter/material.dart';

enum GenderList {Male, Female, Other}

class GenderChecklist extends StatefulWidget {
  const GenderChecklist({super.key});

  @override
  State<GenderChecklist> createState() => _GenderChecklistState();
}

class _GenderChecklistState extends State<GenderChecklist> {
  GenderList? _genderList;
  @override
  Widget build(BuildContext context) {
    return RadioGroup<GenderList>(
      groupValue: _genderList,
      onChanged: (GenderList? value) {
        setState(() {
          _genderList = value;
        });
      }, 
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(1.0),
              leading: Radio<GenderList>(
                value: GenderList.Male
              ),
              title: Text(
                'Male',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              trailing: Icon(Icons.male),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(1.0),
              leading: Radio<GenderList>(
                value: GenderList.Female
              ),
              title: Text(
                'Female',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              trailing: Icon(Icons.female),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(1.0),
              leading: Radio<GenderList>(
                value: GenderList.Other
              ),
              title: Text(
                'Other',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              trailing: Icon(Icons.transgender),
            ),
          )
        ],
      )
    );
  }
}