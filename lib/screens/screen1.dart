import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roomlight_ui/widgets/constants.dart';
import 'package:roomlight_ui/widgets/helper.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 80),
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 1000),
      child: Column(
        children: [
          topRowHome(),
          Expanded(
            child: Container(
              width: _screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
                color: Color(0xffF5F7FB),
              ),
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.all(25),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'All Rooms',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: myDarkBlue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      padding: EdgeInsets.zero,
                      children: combined.map<Widget>((resultList) {
                        return homeWays(
                            resultList[2], resultList[0], resultList[1], context);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
