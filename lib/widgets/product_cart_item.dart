import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import '../models/item_model.dart';

class ProductCardItem extends StatelessWidget {
  final Item item;
  final double cWidth;

  ProductCardItem(this.item, this.cWidth);

  void _selectProduct(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return ProductDetailScreen(item);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectProduct(context),
      child: Container(
        //height: 350.0,
        width: cWidth,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                spreadRadius: 3.0,
                offset: Offset(8.0, 2.0))
          ],
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Colors.grey,
              Theme.of(context).accentColor,
            ],
            stops: [0.3, 1.0, 0.4],
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey),
                child: Image.network(
                  item.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '\$${item.price}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    item.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Excellent'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
