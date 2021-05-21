import 'package:flutter/material.dart';

import '../theme.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> title;
  final int selectedindex;
  final Function(int) onTap;

  CustomTabBar({this.title, this.selectedindex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Row(
              children: title
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap(title.indexOf(e));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: title.indexOf(e) == selectedindex
                                  ? green2
                                  : white,
                              blurRadius:
                                  title.indexOf(e) == selectedindex ? 6 : 0,
                              offset: title.indexOf(e) == selectedindex
                                  ? Offset(0, 3)
                                  : Offset.zero,
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: (title.indexOf(e) == selectedindex
                                ? [green2, green3, green1, green3, green2]
                                : [white, Colors.white]),
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Text(
                          e,
                          style: poppins.copyWith(
                              fontSize: 15,
                              color: (title.indexOf(e) == selectedindex)
                                  ? white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
