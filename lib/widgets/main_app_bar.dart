import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rest/pages/login.dart';
//import 'package:flutter_svg/svg.dart';

class MainAppBar extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
            auth.signOut();
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_basket_outlined),
          onPressed: () {},
        )
      ],
    );
  }
}
