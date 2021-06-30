import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rest/pages/cart.dart';
import 'package:rest/pages/login.dart';
import 'package:rest/pages/store.dart';
//import 'package:flutter_svg/svg.dart';

class CartAppBar extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Store()));
            // auth.signOut();
          },
        ),
      ],
    );
  }
}
