import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountInfoScreens extends StatefulWidget {
  const AccountInfoScreens({super.key});

  @override
  State<AccountInfoScreens> createState() => _AccountInfoScreensState();
}

class _AccountInfoScreensState extends State<AccountInfoScreens> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final user = snapshot.data!;
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Account Information'
          ),
        ),
        backgroundColor: Color(0xFFD4D4D4),
      
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
              right: 15
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 90,
                  ),
                ),
                SizedBox(height: 15,),
                Center(
                  child: Text(
                    'Edit Profile Image',
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Text(
                  'First Name',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Last Name',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none
                    ),
                  )
                ),
                SizedBox(height: 15,),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                Card(
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                      labelText: user.email
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {}, 
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF12005F)
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF12005F),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      );},
    );
  }
}