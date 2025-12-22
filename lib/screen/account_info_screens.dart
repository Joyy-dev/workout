import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/provider/user_provider.dart';

class AccountInfoScreens extends StatefulWidget {
  const AccountInfoScreens({super.key});

  @override
  State<AccountInfoScreens> createState() => _AccountInfoScreensState();
}

class _AccountInfoScreensState extends State<AccountInfoScreens> {
  final _formKey = GlobalKey<FormState>();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _forgetPassword = TextEditingController();

  File? selectedImage;
  bool _isInitialized = false;

  @override
  void dispose() {
    _lastNameController.dispose();
    _firstNameController.dispose();
    _forgetPassword.dispose();
    super.dispose();
  }

  String maskEmail(String email) {
    final parts = email.split('@');
    final name = parts[0];
    final domain = parts[1];

    if (name.length <= 2) {
      return email;
    }

    return '${name.substring(0, 1)}****@$domain';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    if (!_isInitialized && provider.user == null) {
      provider.loadUser();
      _isInitialized = true;
    }

    if (provider.user !=null && _firstNameController.text.isEmpty) {
      _firstNameController.text = provider.user!.firstName;
    }

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
          child: SingleChildScrollView(
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
                    child: GestureDetector(
                      onTap: () async {
                        //
                      },
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: selectedImage != null ? FileImage(selectedImage!) : provider.user?.photoUrl != null
                        ? NetworkImage(provider.user!.photoUrl!) : null
                      ),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none
                      ),
                    )
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
                      controller: _lastNameController,
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
                        labelText: maskEmail(user.email!)
                      ),
                    ),
                  ),
                      ],
                    )
                  ),
                  
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: user.email!
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password reset email sent'))
                      );
                    }, 
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
                      onPressed: provider.isLoading
                      ? null
                      : () {
                        provider.updateProfile(
                          firstName: _firstNameController.text.trim(),
                          image: selectedImage
                        );
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF12005F),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                      ),
                      child: provider.isLoading ?CircularProgressIndicator() : Text(
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
        ),
      );},
    );
  }
}