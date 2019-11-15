import 'package:flutter/material.dart';
import 'package:grocery_app/providers/cart.dart';

import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/providers/groceries.dart';
import 'package:grocery_app/providers/items.dart';
import 'package:grocery_app/screens/home_screen.dart';
//import './screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Items(),
        ),
        ChangeNotifierProvider.value(
          value: Groceries(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: ShoppingCart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.deepOrange,

          primaryColor: Color.fromRGBO(244, 244, 245, 1),

          fontFamily: 'Montserrat',

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.
        ),
        home: HomeScreen(),
      ),
    );
  }
}
