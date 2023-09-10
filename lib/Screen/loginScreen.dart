import 'package:flutter/material.dart';
import 'package:mail/Screen/homeScreen.dart';

import '../models/http_exception.dart';
import '../provider/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool _isSignUp = false;
  bool _isLoading = false;
  Auth verify = new Auth();

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('An error occured!'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_isSignUp) {
        // Sign user up
        await verify.signup(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        // Log user in
        await verify.login(
          _authData['email']!,
          _authData['password']!,
        );
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authenication Failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This Email exist!';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Not A valid Email!';
      } else if (error.toString().contains('WEEK_PASSWORD')) {
        errorMessage = 'this is a week password';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not the email';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid Password';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenicate you';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: _isSignUp ? 300 : 400,
                child: Image.asset("assets/image/login.png"),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                width: 328,
                height: 80,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['email'] = value!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        helperText: "example@flawapp.com",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter your mail"),
                    keyboardType: TextInputType.emailAddress),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                width: 328,
                height: 80,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      helperText: "password@123",
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter your Password"),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: 328,
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                height: _isSignUp ? 140 : 0,
                child: _isSignUp
                    ? TextFormField(
                        onSaved: (value) {},
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          helperText: "Address of flaw app",
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter your Address",
                        ),
                        keyboardType: TextInputType.text,
                      )
                    : const SizedBox(),
              ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 225,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // _submit;
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    child: Text(_isSignUp ? "Sign Up" : "Login"),
                  ),
                ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isSignUp = !_isSignUp;
                  });
                },
                child: Text(
                  _isSignUp ? "Login Instead" : "Signup Instead?",
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
