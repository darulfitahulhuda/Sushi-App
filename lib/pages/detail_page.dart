import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sushiapp/model/sushi.dart';
import 'package:sushiapp/pages/error_page.dart';
import 'package:sushiapp/pages/main_page.dart';
import 'package:sushiapp/theme.dart';
import 'package:sushiapp/widget/ingredients_details.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Sushi sushi;
  DetailPage(this.sushi);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.sushi.favorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Name and Image Sushi
          Padding(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.sushi.name,
                    style: poppins.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.sushi.subtitle,
                    style: poppins.copyWith(
                      fontSize: 16,
                      color: grey,
                    ),
                  ),
                  SizedBox(height: 27),
                  Image.asset(
                    widget.sushi.image,
                    height: 210,
                    width: 250,
                  ),
                ],
              ),
            ),
          ),
          // Body
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 30,
              ),
              SafeArea(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(32, 40, 32, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients',
                        style: poppins.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 124,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.sushi.ingredients
                                .map((e) => IngredientsDetails(
                                    name: e.name, image: e.image))
                                .toList()),
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Details',
                        style: poppins.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.sushi.details,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.clip,
                        style: poppins.copyWith(
                          fontSize: 16,
                          color: grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              )),
            ],
          ),
          // Bottom Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20, left: 14),
                        child: Text(
                          'Rp ',
                          style: poppins.copyWith(fontSize: 10),
                        ),
                      ),
                      Text(
                        (widget.sushi.price * quantity).toString(),
                        style: poppins.copyWith(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 130,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            green2,
                            green3,
                            green1,
                            green2,
                            green3,
                          ]),
                          color: green1,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                gradient: LinearGradient(
                                  colors: [
                                    green2,
                                    green3,
                                    green3,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.only(bottom: 10),
                                icon: Icon(
                                  Icons.minimize,
                                  color: white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                quantity.toString(),
                                textAlign: TextAlign.center,
                                style: poppins.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                gradient: LinearGradient(
                                  colors: [
                                    green2,
                                    green3,
                                    green3,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity = min(50, quantity + 1);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: green1),
                    ),
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 0),
                      icon: Icon(
                        Icons.call,
                        size: 20,
                      ),
                      color: Colors.black87,
                      onPressed: () {
                        launchUrl('tel:${widget.sushi.phoneNumber}');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Top Button (Favorite and Back)
          Padding(
            padding: EdgeInsets.only(left: 32, top: 40, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: grey),
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 6),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    color: Colors.black87,
                    onPressed: () {
                      setState(() {
                        widget.sushi.favorite = isFavorite;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MainPage()));
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: grey),
                  ),
                  child: IconButton(
                      icon: Icon(
                        (isFavorite == true)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 20,
                      ),
                      color: pink,
                      onPressed: toggleFavorite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
