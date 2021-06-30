import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rest/models/product.dart';
import 'package:rest/pages/meal_details.dart';
//import 'package:rest/widgets/home_options.dart';
import 'package:rest/widgets/main_app_bar.dart';
import 'package:rest/firestore.dart';

class Store extends StatelessWidget {
  final List<Product> menu = menuList;

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
                MainAppBar(),
                SizedBox(
                  height: 5.0,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Choose your meal",
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
                SizedBox(
                  height: 20.0,
                ),
                //HomeOptions(),
                // SizedBox(
                //   height: 30.0,
                // ),
                Flexible(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: menu.length,
                    itemBuilder: (BuildContext context, int index) => ZoomIn(
                      child: Hero(
                        tag: "watch-$index",
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return WatchDetails(
                                    meal: menu[index],
                                    tag: "watch-$index",
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: NetworkImage(menu[index].image),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu[index].name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    background: Paint()
                                      ..color = Color.fromRGBO(143, 148, 251, 1)
                                      ..strokeWidth = 18.5
                                      ..style = PaintingStyle.stroke,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                // Text(
                                //   watches[index].name,
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //     fontSize: 14.0,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // staggeredTileBuilder: (int index) =>
                    //     new StaggeredTile.count(2, index.isEven ? 3 : 2),
                    // mainAxisSpacing: 10.0,
                    // crossAxisSpacing: 10.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
