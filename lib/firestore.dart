import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rest/models/product.dart';
import 'package:flutter/material.dart';
import 'package:rest/main.dart';
import 'dart:core';

List<Product> menuList = [];

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class InitFirebase extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<InitFirebase> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMeals();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Welcome to Flutter'),
        // ),
        body: Center(
          child: Text("Loading"),
        ),
      ),
    );;
      },
    );
  }
}

class GetMeals extends StatelessWidget {
  //final String documentId;

  //GetMeals(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference meals = FirebaseFirestore.instance.collection('meals');

    meals.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        Product newProduct = new Product(
            name: element['name'],
            image: element['image'],
            price: element['price'],
            category: element['category'],
            description: element['description']);
        menuList.add(newProduct);
        print(newProduct.name);
      });
    });
    return MyApp();
  }
}

class SomeError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: InitFirebase(),
        ),
      ),
    );
  }
}
