import 'package:flutter/material.dart';
import 'package:sushiapp/pages/main_page.dart';
import 'package:sushiapp/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // gambar
            Container(
              height: 85,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/404.png'))),
            ),
            SizedBox(height: 70),
            // Text 1
            Text("Where are you going?", style: poppins.copyWith(fontSize: 24)),
            SizedBox(height: 14),
            // Text 2
            Text(
              "Seems like the page you were\nrequested is already gone",
              style: poppins.copyWith(fontSize: 16, color: grey),
              textAlign: TextAlign.center,
            ),
            // bottom Back to Home
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 50,
              width: 210,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: green1,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17))),
                  onPressed: () {
                    // Get.to(() => HomePage());
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => MainPage()));
                  },
                  child: Text(
                    "Back to Home",
                    style: poppins.copyWith(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
