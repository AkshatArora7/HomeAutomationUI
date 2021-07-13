import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roomlight_ui/models/changeable.dart';
import 'package:roomlight_ui/screens/screen1.dart';
import 'package:roomlight_ui/screens/screen2.dart';
import 'package:roomlight_ui/widgets/constants.dart';
import 'package:roomlight_ui/widgets/helper.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < title.length; i++) {
      List<String> temp = [];
      temp.add(title[i]);
      temp.add(lCount[i].toString());
      temp.add(SVGs[i]);
      combined.add(temp);
    }
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
  }
  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return ChangeNotifierProvider<screenChange>(
      create: (_)=>screenChange(),
      child: Scaffold(
        backgroundColor: myDarkBlue,
        bottomNavigationBar: customBottomBar(_screenWidth),
        body: Stack(
          children: [
            Container(
              height: _screenHeight,
              width: _screenWidth,
              alignment: Alignment.topCenter,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(animationController!),
                  child: SvgPicture.asset('assets/Circles.svg')),
            ),
            Consumer<screenChange>(builder: (context, screenChange, child)=>screenChange.usePage()),
          ],
        ),
      ),
    );
  }
}
