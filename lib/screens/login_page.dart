import 'package:flutter/material.dart';
import 'package:saark/screens/Tank_overview.dart';
import 'package:saark/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 50.0),
                    ),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Username!';
                          }
                          return null;
                        },
                        onChanged: (username) {
                          this.username = username;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: kPrimaryColor,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(fontSize: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password!';
                          }
                          return null;
                        },
                        onChanged: (password) {
                          this.password = password;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: kPrimaryColor,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    width: 20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //_initializeData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TanksOverview1(
                                username: username,
                                password: password,
                              ),
                            ),
                          );
                        }
                        /*setState(() {
                          _showSpinner = true;
                        });
                        try {
                          setState(() {
                            _wrongEmail = false;
                            _wrongPassword = false;
                          });
                          final newUser = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, Done.id);
                          }
                        } catch (e) {
                          print(e.code);
                          if (e.code == 'ERROR_WRONG_PASSWORD') {
                            setState(() {
                              _wrongPassword = true;
                            });
                          } else {
                            setState(() {
                              emailText = 'User doesn\'t exist';
                              passwordText = 'Please check your email';

                              _wrongPassword = true;
                              _wrongEmail = true;
                            });
                          }
                        }*/
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
