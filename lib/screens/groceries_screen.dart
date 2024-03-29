import 'package:flutter/material.dart';
import 'package:grocery_app/providers/groceries.dart';
import 'package:grocery_app/widgets/grocery_card_item.dart';
import 'package:provider/provider.dart';

class GroceriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Text(
            'Your nearby stores',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: Provider.of<Groceries>(context, listen: false)
                    .getGroceries(),
                builder: (context, dataSnapShopt) {
                  if (dataSnapShopt.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // there was an error
                    if (dataSnapShopt.error != null) {
                      return Center(
                        child: Text('An error occured'),
                      );
                    } else {
                      // we got data
                      return Consumer<Groceries>(
                        builder: (context, data, child) {
                          return ListView.builder(
                            itemCount: data.groceries.length,
                            itemBuilder: (context, index) {
                              final grocery = data.groceries[index];
                              return GroceryCardItem(
                                grocery: grocery,
                              );
                            },
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
