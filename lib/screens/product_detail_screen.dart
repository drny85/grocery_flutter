import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/productDetail';
  final Item item;

  ProductDetailScreen(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width - 80.0,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Image.network(
                    item.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                        print('YES');
                      },
                    ),
                  ],
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
                Text(
                  item.description,
                  style: TextStyle(
                      letterSpacing: 1.1, fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {},
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
      ),
    );
  }
}
