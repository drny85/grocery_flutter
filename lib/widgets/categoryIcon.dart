import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final IconData iconData;
  final String name;
  CategoryIcon({this.iconData, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 30,
            color: Theme.of(context).accentColor,
          ),
          Text(name)
        ],
      ),
    );
  }
}
