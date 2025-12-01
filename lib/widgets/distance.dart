import 'package:flutter/material.dart';

class Distance extends StatelessWidget {
  const Distance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF12005F),
              child: Icon(Icons.show_chart, color: Colors.white,),
            ),
            title: Text(
              'Distance Increase 37%'
            ),
            subtitle: Text(
              'yesterday : 2.8 Km'
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distance'
                    ),
                    Row(
                      children: [
                        Text(
                          '6.834',
                          style: TextStyle(
                            fontSize: 25
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'm',
                            style: TextStyle(
                              fontSize: 12
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distance'
                    ),
                    Row(
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          '1.900',
                          style: TextStyle(
                            fontSize: 25
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'm',
                            style: TextStyle(
                              fontSize: 12
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Point'
                    ),
                    Row(
                      children: [
                        Text(
                          '1.136',
                          style: TextStyle(
                            fontSize: 25
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'm',
                            style: TextStyle(
                              fontSize: 12
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: const Color.fromARGB(255, 224, 224, 224),
            ),
          )
        ],
      ),
    );
  }
}