import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roomlight_ui/models/changeable.dart';
import 'package:roomlight_ui/widgets/constants.dart';
import 'package:roomlight_ui/widgets/helper.dart';

class screen2 extends StatefulWidget {
  final String title;
  final String count;

  const screen2({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  int value = 6;

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Consumer<screenChange>(
      builder: (context, screenChange, child) => AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: mySeconds),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 17),
                child: topRowTile(widget.title, widget.count, context)),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      //TILES
                      AnimatedContainer(
                        width: _screenWidth,
                        height: 70,
                        duration: Duration(seconds: mySeconds),
                        curve: Curves.fastOutSlowIn,
                        margin: EdgeInsets.only(
                            left: !screenChange.animate ? _screenWidth / 2 : 0),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: 120,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/surface1.svg',
                                      color: myDarkBlue,
                                    ),
                                    Text(
                                      'Main Light',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: myDarkBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xff002f6e),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/furniture-and-household.svg',
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Desk Light',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/bed (1).svg',
                                      color: myDarkBlue,
                                    ),
                                    Text(
                                      'Bed Light',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: myDarkBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/surface1.svg',
                                      color: myDarkBlue,
                                    ),
                                    Text(
                                      'Main Light',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        color: myDarkBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      //MAIN
                      Flexible(
                        flex: 6,
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(
                              top: !screenChange.animate ? 1 : 26),
                          width: _screenWidth,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            ),
                            color: Color(0xffF5F7FB),
                          ),
                          // margin: const EdgeInsets.only(top: 40),
                          duration: Duration(seconds: mySeconds),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(25),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Intensity',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: myDarkBlue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/solution2.svg'),
                                          Expanded(
                                            child: Slider(
                                              min: 0,
                                              max: 6,
                                              value: !screenChange.animate
                                                  ? 0
                                                  : value.toDouble(),
                                              divisions: 6,
                                              activeColor: Color(0xffFFD700),
                                              inactiveColor:
                                                  Colors.grey.withOpacity(0.5),
                                              thumbColor: Colors.white,
                                              onChanged: (double newValue) {
                                                setState(() {
                                                  value = newValue.round();
                                                  screenChange.useOpacity(value);
                                                });
                                              },
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'assets/solution1.svg',
                                            color: Colors.yellow,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(25),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Colors',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: myDarkBlue,
                                        ),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      duration: Duration(seconds: mySeconds),
                                      curve: Curves.fastOutSlowIn,
                                      // padding: EdgeInsets.only(right: !screenChange.animate?_screenWidth/2: 1),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: _screenWidth - 70,
                                              height: 50,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: colors.map<Widget>((e) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      screenChange.useColor(e);
                                                    },
                                                    child: AnimatedContainer(
                                                      margin: EdgeInsets.symmetric(
                                                          horizontal:
                                                              !screenChange.animate
                                                                  ? 0
                                                                  : 10),
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: e,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      duration: Duration(
                                                          seconds: mySeconds),
                                                      curve: Curves.fastOutSlowIn,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child:
                                                  SvgPicture.asset('assets/+.svg'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.only(top: 25, left: 25),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Scenes',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: myDarkBlue,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: _screenHeight,
                                      child: GridView.count(
                                        childAspectRatio: 2 / 1,
                                        padding: EdgeInsets.zero,
                                        crossAxisCount: 2,
                                        children: sceneColors.map<Widget>((e) {
                                          int i = sceneColors.indexOf(e);
                                          return AnimatedContainer(
                                            decoration: BoxDecoration(
                                                // color: e,
                                                gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  stops: !screenChange.animate
                                                      ? [
                                                          0.0,
                                                          0.0,
                                                          0.5,
                                                        ]
                                                      : [
                                                          0.1,
                                                          0.5,
                                                          0.9,
                                                        ],
                                                  colors: [
                                                    e,
                                                    e.withOpacity(0.8),
                                                    e,
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: screenChange.animate?20:0),
                                            duration: Duration(seconds: mySeconds),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/surface1.svg',
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  sceneName[i],
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Power button
                  Positioned(
                    right: 20,
                    top: 70,
                    child: Container(
                      width: 35,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 50,
                            )
                          ]),
                      child: IconButton(
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        icon: SvgPicture.asset(
                            'assets/Icon awesome-power-off.svg'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
