import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/screens/groceries_screen.dart';
import 'package:grocery_app/screens/my_grocery_screen.dart';
import 'package:grocery_app/screens/shopping_cart_screen.dart';

//import 'package:grocery_app/providers/items.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Categories>(context).getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final items = Provider.of<Items>(context).items;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          GroceriesScreen(),
          MyGroceryScreen(),
          ShoppingCartScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        activeColor: Theme.of(context).accentColor,
        inactiveColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('My Grocery',
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart',
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
        ],
      ),
    );
  }
}
