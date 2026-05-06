import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form data
      String email = _emailController.text;
      String password = _passwordController.text;
      print('Email: $email, Password: $password');
    }
  }

  Widget socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red, size: 25),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 25),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue, size: 25),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black, size: 25),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In', style: TextStyle(fontFamily: 'Gevora'))),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mountain.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Welcome to Gusky!',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gevora',
                      color: const Color(0xFFFFC53D),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Sign In to continue',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle "Forgot Password?" tap
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.0),

                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: 16.0),

                    Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Don\'t have an account? Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gevora',
                        ),
                      ),
                    ),

                    Stack(
                      children: [
                        Divider(thickness: 2.0),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: socialIcons(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
