import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout/screen/history_screen.dart';
import 'package:workout/screen/home_screens.dart';
import 'package:workout/screen/progress_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreens(),
    HistoryScreen(),
    ProgressScreen()
  ];

  List <IconData> icons = [
    Icons.home_outlined,
    Icons.history,
    Icons.bar_chart,
    Icons.calendar_today,
    Icons.account_circle_outlined
  ];

  List<String> label = [
    'Home',
    'History',
    'Progress',
    'Calender',
    'Profile'
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
  }

  _loadSelectedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('selectedIndex') ?? 0;
    });
  }

  _saveSelectedIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedIndex', index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4D4D4),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 15,
          left: 15,
          right: 15
        ),
        child: Container(
          height: 70,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 6),
                blurRadius: 10,
                color: Colors.grey
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    _saveSelectedIndex(index);
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isSelected ? Color(0xFF12005F) : Colors.transparent
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                      if (isSelected) ...[
                        SizedBox(width: 8,),
                        Text(
                          label[index],
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              );
            })
          ),
        ),
      ),
      //body: screens[selectedIndex],
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
    );
  }
}