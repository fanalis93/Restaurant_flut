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
  final auth = FirebaseAuth.instance;

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
	                  fit: BoxFit.fill
	                )
	              ),
	              
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
                    Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 10),
	                      child: Center(
	                        child: Text("Sign In", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1), fontSize: 30, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  ),
	                  FadeAnimation(1.8, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
                              onChanged: (value) {
                                setState((){
                                  _password = value.trim();
                                });
                              },
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: 'Password',
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
                              onChanged: (value) {
                                setState((){
                                  _password = value.trim();
                                });
                              },
	                          ),
	                        )
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  // FadeAnimation(2, Container(
	                  //   height: 50,
	                  //   decoration: BoxDecoration(
	                  //     borderRadius: BorderRadius.circular(10),
	                  //     gradient: LinearGradient(
	                  //       colors: [
	                  //         Color.fromRGBO(143, 148, 251, 1),
	                  //         Color.fromRGBO(143, 148, 251, .6),
	                  //       ]
	                  //     )
	                  //   ),
	                  //   // child: FlatButton(
	                  //   //   child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    //   //   onPressed: () async {
                    //   //     // dynamic result = await _auth.signInAnon();
                    //   //     // if(result == null) {
                    //   //     //   print('error siging in');
                    //   //     // }else {
                    //   //     //   print('signed in');
                    //   //     //   print(result);
                    //   //     // }
                    //   //   }

	                  //   // ),
	                  // )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      RaisedButton(
                        color: Color.fromRGBO(143, 148, 251, 1),
                        child: Text('SignIn',style: TextStyle(color: Colors.white)),
                        onPressed: () => _signin(_email, _password)
                        ),
                      
                    ],),
	                  SizedBox(height: 10,),
	                  // FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
	                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Signup()));
                        },
                        onLongPress: (){
                          
                        }, 
                        child: new Text("Create a new account.", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1))),
                    ),
	                  SizedBox(height: 10,),

                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Store()));
                        },
                        onLongPress: (){
                          
                        }, 
                        child: new Text("Go to Store", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1))),
                    )
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
  _signin(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.signInWithEmailAndPassword(email: _email, password : _password);

      //Success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Store()));

    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message,gravity: ToastGravity.TOP);
    }

  }
  _signup(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.createUserWithEmailAndPassword(email: _email, password : _password);

      //Success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Store()));

    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message,gravity: ToastGravity.TOP,);
    }

  }
}