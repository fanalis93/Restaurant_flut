import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:rest/constants.dart';

class CartFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              
            },
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              height: 60.0,
              padding: EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Color.fromRGBO(230, 230, 230, 1),
                ),
              ),
              child: Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     RaisedButton(
        //        color: Color.fromRGBO(143, 148, 251, 1),
        //        child: Text('Add to cart',style: TextStyle(color: Colors.white)),
        //        onPressed: (){}
        //        ),
        //        ],),
      ],
    );
  }
}
