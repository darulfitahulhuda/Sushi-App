import 'package:flutter/material.dart';
import 'package:sushiapp/theme.dart';

class IngredientsDetails extends StatelessWidget {
  final String name;
  final String image;

  const IngredientsDetails({Key key, @required this.name, @required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      margin: EdgeInsets.only(right: 10),
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: grey2,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 50,
            width: 40,
            // fit: BoxFit.cover,
          ),
          Text(
            name,
            style: poppins.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
