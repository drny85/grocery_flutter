import 'package:flutter/material.dart';

class GoBackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.grey,
      onTap: () {
        Navigator.pop(context);
      },
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_back_ios,
          size: 24.0,
        ),
      ),
    );
  }
}
