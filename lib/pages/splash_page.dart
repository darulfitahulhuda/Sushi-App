import 'package:flutter/material.dart';
import 'package:sushiapp/pages/main_page.dart';
import 'package:sushiapp/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_image.png',
              height: 340,
            ),
            SizedBox(height: 36),
            Text(
              'Fastest Food\ndelivery to your door',
              textAlign: TextAlign.center,
              style:
                  poppins.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'We will deliver you food as quickly and\nqualitatively as possible',
              textAlign: TextAlign.center,
              style: poppins.copyWith(fontSize: 16, color: grey),
            ),
            SizedBox(height: 44),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => MainPage()));
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: green2,
                      blurRadius: 5.0,
                      offset: Offset(1, 1),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [green2, green3, green1, green3, green2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  height: 64,
                  width: 270,
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: poppins.copyWith(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
