import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rest/models/product.dart';
import 'package:rest/pages/meal_details.dart';
//import 'package:rest/widgets/home_options.dart';
import 'package:rest/widgets/main_app_bar.dart';

class Store extends StatelessWidget {
  final List<Product> menu = [
    Product(
      name: "Lamb Soup",
      image: "assets/images/food-1.jpg",
      price: 24.00,
      category: "Main Course",
      description:
          "Generous portioin of lamb meat cooked for in a blend of spices until it becomes tender. Served with bread.",
    ),
    Product(
      name: "Salad",
      image: "assets/images/food-2.jpg",
      price: 15.00,
      category: "Main Course",
      description:
          "Healthy Salad made from freshly sourced vegetables, drizzled with olive oil. Served with seasame breads.",
    ),
    Product(
      name: "Falafel",
      image: "assets/images/food-3.jpg",
      price: 10.99,
      category: "Appetizer",
      description:
          "Serving of smoking hot deep fried falafels. Comes with dipping sauce.",
    ),
    Product(
      name: "Moutabal",
      image: "assets/images/food-4.jpg",
      price: 8.00,
      category: "Side Dish",
      description:
          "Freshly made. Perfect dipping for your breads.",
    ),
    Product(
      name: "Samosa",
      image: "assets/images/food-5.jpg",
      price: 10.99,
      category: "Appetizer",
      description:
          "Assortment of delicious fried samosas.Comes with dippping sauce.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: Color.fromRGBO(34, 34, 34, 1),
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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    meal: this.menu[index],
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
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(menu[index].image),
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
                                    ..color = Colors.black87
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
