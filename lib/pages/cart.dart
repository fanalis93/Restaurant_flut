import 'package:flutter/material.dart';
import 'package:rest/widgets/cart_app_bar.dart';
import 'package:rest/widgets/cart_footer.dart';
import 'package:rest/widgets/main_app_bar.dart';

class Cart extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer = NavDrawer(),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CartAppBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Falafel",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              // color: Color.fromRGBO(34, 34, 34, 1),
                              color: Color.fromRGBO(143, 148, 251, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "1",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              // color: Color.fromRGBO(34, 34, 34, 1),
                              color: Color.fromRGBO(143, 148, 251, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Lamb Soup",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              // color: Color.fromRGBO(34, 34, 34, 1),
                              color: Color.fromRGBO(143, 148, 251, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "3",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              // color: Color.fromRGBO(34, 34, 34, 1),
                              color: Color.fromRGBO(143, 148, 251, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height:350),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Total",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              // color: Color.fromRGBO(34, 34, 34, 1),
                              color: Color.fromRGBO(143, 148, 251, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "MYR 82.99",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              // color: Color.fromRGBO(34, 34, 34, 1),
                              color: Color.fromRGBO(143, 148, 251, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CartFooter(),
              ],
            )
          
          )
        )

      )
    );
  }
}