import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roomlight_ui/models/changeable.dart';

import 'constants.dart';

Widget customBottomBar(double _screenWidth) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: myLightBlue.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 5,
          offset: Offset(0, 7), // changes position of shadow
        ),
      ],
    ),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: _screenWidth / 8),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/bulb.svg'), label: 'Lights'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Icon feather-home.svg'),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Icon feather-settings.svg'),
              label: 'Settings'),
        ],
      ),
    ),
  );
}

Widget homeWays(String SVG, String Title, String LCount, BuildContext context) {
  return Consumer<screenChange>(
    builder: (context, screenChange, child) => GestureDetector(
      onTap: () {
        screenChange.buttonSwitch(Title, LCount, false);
        screenChange.startAnimation(true);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 0.1,
              )
            ],
            borderRadius: BorderRadius.circular(19)),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset('assets/$SVG.svg'),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 22),
                alignment: Alignment.topLeft,
                child: Text(
                  '$Title',
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Flexible(
                child: Container(
              margin: EdgeInsets.only(left: 22),
              alignment: Alignment.topLeft,
              child: Text(
                '$LCount Lights',
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFD700)),
              ),
            )),
          ],
        ),
      ),
    ),
  );
}

Widget topRowHome() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Control\nPanel',
            style: GoogleFonts.roboto(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: Badge(
                shape: BadgeShape.circle,
                padding: const EdgeInsets.all(6),
                badgeColor: Colors.pinkAccent,
                position: BadgePosition.topEnd(top: 0, end: 0),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/prof.JPG'),
                ),
              ),
            )),
      ],
    ),
  );
}

Widget topRowTile(String title, String count, BuildContext context) {
  return Consumer<screenChange>(
    // ignore: avoid_types_as_parameter_names
    builder: (context, screenChange, child) => Container(
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 42),
                child: IconButton(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    iconSize: 15,
                    alignment: Alignment.topLeft,
                    icon: SvgPicture.asset(
                        'assets/Icon ionic-md-arrow-round-back.svg'),
                    onPressed: () {
                      screenChange.buttonSwitch(title, count, true);
                      screenChange.startAnimation(false);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 42),
                  // color: Colors.green,
                  height: 100,
                  child: Stack(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedPositioned(
                        duration: Duration(seconds: mySeconds),
                        curve: Curves.fastOutSlowIn,
                        top: !screenChange.animate ? 25 : 55,
                        child: Container(
                          // color: Colors.red,
                          // duration: Duration(seconds: mySeconds),
                          // curve: Curves.fastOutSlowIn,
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            '$count Lights',
                            softWrap: true,
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFD700)),
                          ),
                        ),
                      ),
                      Container(
                        color: myDarkBlue,
                        child: Text(
                          title.replaceAll(' ', '\n'),
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Center(
              child: Container(
                height: 175,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        duration: Duration(seconds: mySeconds),
                        curve: Curves.fastOutSlowIn,
                        top: !screenChange.animate?0:40,
                        left: 25,
                        child: SvgPicture.asset(
                          'assets/light bulb.svg',
                          color:
                              screenChange.color.withOpacity(screenChange.opacity),
                          cacheColorFilter: false,
                        )),
                    AnimatedPositioned(
                        duration: Duration(seconds: mySeconds),
                        curve: Curves.fastOutSlowIn,
                        top: !screenChange.animate?0:40,
                        left: 25,
                        child: SvgPicture.asset('assets/Group 38.svg')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//!screenChange.animate ? 0 : 20
