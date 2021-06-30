import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.menu_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_basket_outlined),
          onPressed: () {},
        )
      ],
    );
  }
}
