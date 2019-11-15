import 'package:flutter/material.dart';
import 'package:grocery_app/providers/cart.dart';
import 'package:provider/provider.dart';
import '../models/item_model.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/productDetail';
  final Item item;

  ProductDetailScreen(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                width: double.infinity,
                color: Colors.grey,
                child: Image.network(
                  item.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                        print('YES');
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: MediaQuery.of(context).size.width - 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          backgroundColor: Colors.black12,
                        ),
                      ),
                      Text(
                        '\$${item.price}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Item description',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.2)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                child: Text(
                  item.description,
                  style: TextStyle(
                      letterSpacing: 1.1,
                      fontStyle: FontStyle.italic,
                      fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () async {
                  await Provider.of<ShoppingCart>(context).addToCart(item);
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Theme.of(context).accentColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
