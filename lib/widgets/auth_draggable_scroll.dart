import 'package:flutter/material.dart';

class AuthDraggableScroll extends StatefulWidget {
  const AuthDraggableScroll({super.key});

  @override
  State<AuthDraggableScroll> createState() => _AuthDraggableScrollState();
}

class _AuthDraggableScrollState extends State<AuthDraggableScroll> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.6,
      initialChildSize: 0.5,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return SafeArea(
          child: SingleChildScrollView(
          controller: scrollController,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                color: Color(0xFFD4D4D4)
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 19
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      elevation: 5,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        validator: (value) {
                          if (value == null || !value.contains('@')) {
                            return 'Invalid Email Address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      elevation: 5,
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }, 
                            icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password must contain atleast 8 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      elevation: 5,
                      child: TextFormField(
                        controller: _confirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }, 
                            icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF12005F),
                          foregroundColor: Colors.white
                        ),
                        onPressed: () {}, 
                        child: Text(
                          'Sign Up'
                        )
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, 
                      child: Text(
                        'Already have an account? Sign In'
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}