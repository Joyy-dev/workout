import 'package:flutter/material.dart';

class AuthDraggableScroll extends StatelessWidget {
  const AuthDraggableScroll({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 19
                    ),
                  ),
                  Card(
                    child: TextFormField(),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    child: TextFormField(),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text(
                      'Create Account'
                    )
                  ),
                  SizedBox(height: 20,),
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
        );
      },
    );
  }
}