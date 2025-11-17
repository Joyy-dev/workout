import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout/screen/home_screens.dart';

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
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  Future<void> _submitAuthForm() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _password.text.trim(); 
      final confirmPassword = _confirmPassword.text.trim();

      try {
        if (_isLogin) {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, 
            password: password
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome back'))
          );
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => HomeScreens())
          );
        } else {
          if (password != confirmPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Password do not match'))
            );
            return;
          }
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, 
            password: password
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Account successfully created!!'))
          );
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => HomeScreens())
          );
        }
      } on FirebaseAuthException catch(error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Authentication Failed!'))
        );
      } catch(error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Oops!! Something: $error'))
        );
      }
    } 
  }

  @override
  void initState() {
    super.initState();
    
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => HomeScreens())
        );
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.6,
      initialChildSize: 0.5,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
            ),
            color: Color(0xFFD4D4D4)
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isLogin ? 'Hello \n Sign In' : 'Create Your \n Account',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
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
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password must contain atleast 8 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    if (!_isLogin)
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
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value == null || value != _password.text) {
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
                        onPressed: _submitAuthForm, 
                        child: Text(
                          _isLogin ? 'Sign In' : 'Sign Up' 
                        )
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      }, 
                      child: Text(
                        _isLogin ? 'Don\'t have an account? Sign Up' : 'Already have an account? Sign In'
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