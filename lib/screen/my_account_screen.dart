import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  String extractFirstName(String email) {
    if (email.isEmpty) return 'User';
    String namePart = email.split('@')[0];
    namePart = namePart.split(RegExp(r'[._]'))[0];
    return namePart[0].toUpperCase() + namePart.substring(1).toLowerCase();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator()
          );
        }
        final user = snapshot.data!;
        final firstName = extractFirstName(user.email ?? '');
        return Scaffold(
        backgroundColor: Color(0xFFD4D4D4),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
              left: 15
            ),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 120,
                        backgroundImage: AssetImage('assets/images/gym.png'),
                      ),
                      Positioned(
                        top: 180,
                        right: 5,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF12005F),
                          child: IconButton(
                            onPressed: () {}, 
                            icon: Icon(
                              Icons.edit,
                              size: 27,
                              color: Colors.white,
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  firstName,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  user.email ?? 'No email found'
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF12005F),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Premium Membership',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                ListTile(
                  contentPadding: EdgeInsets.all(1),
                  leading: CircleAvatar(
                    child: Icon(Icons.account_circle_outlined),
                  ),
                  title: Text('Account Information'),
                  trailing: IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.chevron_right)
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(1),
                  leading: CircleAvatar(
                    child: Icon(Icons.calendar_month),
                  ),
                  title: Text('Add Activity'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(1),
                  leading: CircleAvatar(
                    child: Icon(Icons.signal_wifi_statusbar_connected_no_internet_4),
                  ),
                  title: Text('Physical Status'),
                  trailing: IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.chevron_right)
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(1),
                  leading: CircleAvatar(
                    child: Icon(Icons.auto_graph_sharp),
                  ),
                  title: Text('Activity statistics'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(1),
                  leading: CircleAvatar(
                    child: Icon(Icons.logout),
                  ),
                  title: Text('Logout'),
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}