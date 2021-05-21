import 'package:flutter/material.dart';
import 'package:sushiapp/model/sushi.dart';
import 'package:sushiapp/theme.dart';

class SushiCard extends StatefulWidget {
  final Sushi sushi;

  SushiCard(this.sushi);

  @override
  _SushiCardState createState() => _SushiCardState();
}

class _SushiCardState extends State<SushiCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.sushi.favorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.sushi.favorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: 225,
      width: 165,
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      widget.sushi.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10, top: 10),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: toggleFavorite,
                      child: Icon(
                        (widget.sushi.favorite == true)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.sushi.name,
                    style: poppins.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.sushi.duration.toString(),
                        style: poppins.copyWith(
                          color: grey,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 2,
                        color: Colors.black,
                        height: 1,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.star_border_outlined,
                        size: 11,
                        color: gold,
                      ),
                      SizedBox(width: 2),
                      Text(
                        widget.sushi.rating.toString(),
                        style: poppins.copyWith(fontSize: 13, color: grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, right: 2),
                        child: Text(
                          'Rp',
                          style: poppins.copyWith(
                            fontSize: 10,
                            color: grey,
                          ),
                        ),
                      ),
                      Text(
                        widget.sushi.price.toString(),
                        style: poppins.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
