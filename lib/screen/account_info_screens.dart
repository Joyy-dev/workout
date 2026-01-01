import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final ImagePicker _picker = ImagePicker();

  File? selectedImage;

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

  Future<void> pickImageFromDevice() async {
    debugPrint('Image picker tapped');


    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80
    );

    debugPrint('picked image: ${image?.path}');

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    // if (provider.user !=null && _firstNameController.text.isEmpty) {
    //   _firstNameController.text = provider.user!.firstName;
    // }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final authUser = snapshot.data!;
        final provide = context.read<UserProvider>();
        
        if (provide.user == null) {
          provide.loadUser(authUser.uid);
        }
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
                      onTap: () {
                        pickImageFromDevice();
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
                    child: GestureDetector(
                      onTap: () {
                        pickImageFromDevice();
                      },
                      child: Text(
                        'Edit Profile Image',
                        style: TextStyle(
                          fontSize: 17
                        ),
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
                        labelText: maskEmail(authUser.email!)
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
                        email: authUser.email!
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


                  Text(
                    'User loaded: ${provider.user != null}, Loading: ${provider.isLoading}'
                  ),



                  Center(
                    child: ElevatedButton(
                      onPressed: provider.isLoading || provider.user == null
                      ? null
                      : () async {
                        await provider.updateProfile(
                          firstName: _firstNameController.text.trim(),
                          image: selectedImage
                        );

                        if (!mounted) return;

                          showDialog(
                            context: context, 
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Update successful!'),
                                content: Text('Changes saved successfully!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }, 
                                    child: Text('Ok')
                                  )
                                ],
                              );
                            },
                          );
                        
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF12005F),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                      ),
                      child: provider.isLoading ? CircularProgressIndicator() : Text(
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