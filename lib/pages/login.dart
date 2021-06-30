import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rest/constants.dart';
import 'package:rest/pages/Animation/FadeAnimation.dart';
import 'package:rest/pages/signup.dart';
import 'package:rest/pages/store.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  FirebaseAuth auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/login.jpg'),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "default@email.com",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     _email = value.trim();
                                  //   });
                                  // },
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'SomePassword',
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    // onChanged: (value) {
                                    //   setState(() {
                                    //     _password = value.trim();
                                    //   });
                                    // },
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      // )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              child: Text('SignIn',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  _email = emailController.text;
                                  _password = passwordController.text;
                                });
                                _signin();
                              }
                              // onPressed: () {
                              //   _signin(_email, _password);
                              //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Store()));

                              // }
                              ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        onLongPress: () {},
                        child: new Text("Create a new account.",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1))),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Store()));
                        },
                        //onLongPress: () {},
                        child: new Text("Access as a Guest",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _signup(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      //Success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Store()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message,
        gravity: ToastGravity.TOP,
      );
    }
  }

  _signin() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == 'user-disabled') {
        print('User disbaled by Admin');
      }
    }

    auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Store()));
      }
    });
    //return Store();
  }
}
