import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sushiapp/model/sushi.dart';
import 'package:sushiapp/pages/detail_page.dart';
import 'package:sushiapp/theme.dart';
import 'package:sushiapp/widget/custom_tabbar.dart';
import 'package:sushiapp/widget/sushi_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abigel Amaniah",
                        style: poppins.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Welcome back!",
                          style: poppins.copyWith(fontSize: 16, color: grey)),
                    ],
                  ),
                  Image.asset(
                    'assets/profile_picture.png',
                    height: 41,
                  ),
                ],
              ),
              // Discount
              Container(
                margin: EdgeInsets.only(top: 32),
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: green2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [green2, green1, green3],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                    ),
                    Image.asset('assets/background.png'),
                    Container(
                      padding: EdgeInsets.only(top: 26, left: 20),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fee food delivery\nwith 15% discount',
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.clip,
                            style: poppins.copyWith(
                              color: white,
                              fontSize: 19,
                            ),
                          ),
                          SizedBox(height: 18),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Grab Now',
                              style: poppins.copyWith(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/sushi.png')),
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 32,
                          width: 65,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '15% off',
                            style: poppins.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              // TapBar
              CustomTabBar(
                title: [
                  'All',
                  'Popular',
                ],
                selectedindex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 32),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (_, index) {
                  var sushis = listSushi.where((element) => element.types
                      .contains(
                          (selectedIndex == 0) ? Types.All : Types.Popular));
                  return GridView.count(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.3),
                    crossAxisCount: 2,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: sushis
                        .map((e) => Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailPage(e)));
                                  },
                                  child: SushiCard(e)),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
