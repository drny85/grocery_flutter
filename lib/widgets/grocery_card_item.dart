import 'package:flutter/material.dart';
import 'package:grocery_app/models/grocery.dart';
import 'package:grocery_app/providers/items.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:provider/provider.dart';

class GroceryCardItem extends StatelessWidget {
  final Grocery grocery;
  GroceryCardItem({this.grocery});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<Items>(context).getItemsByGrocery(grocery.id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          color: Colors.black38,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5.0,
                offset: Offset(2.0, 5.0),
                spreadRadius: 6.0)
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                grocery.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Text(
                grocery.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    backgroundColor: Colors.black26,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white70,
                    letterSpacing: 2.0,
                    fontFamily: 'RobotoCondensed'),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //color: Colors.black54,
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.black38, Colors.black54],
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Text(
                            grocery.address,
                            style: kGroceryCardTextStyle,
                          ),
                        ),
                        Text(
                          grocery.city.toUpperCase(),
                          style: kGroceryCardTextStyle,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        'Phone: ${grocery.phone}',
                        style: kGroceryCardTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
