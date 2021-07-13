import 'package:flutter/cupertino.dart';
import 'package:roomlight_ui/screens/screen1.dart';
import 'package:roomlight_ui/screens/screen2.dart';
import 'package:roomlight_ui/widgets/constants.dart';

class screenChange extends ChangeNotifier {
  bool isMain = true;
  String whichButton = "Main";
  String count = '0';
  Color color = Color(0xffFFD700);
  double opacity = 1.0;
  bool animate = false;

  buttonSwitch(String name, String count1, bool isMain1) {
    whichButton = name;
    count = count1;
    isMain = isMain1;
    notifyListeners();
  }

  usePage() {
    return AnimatedSwitcher(
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
      child: isMain
          ? const screen1()
          : screen2(
              title: whichButton,
              count: count,
            ),
    );
  }

  useColor(Color color1) {
    color = color1;
    notifyListeners();
  }

  useOpacity(int value) {
    switch (value) {
      case 1:
        opacity = 0.1;
        break;
      case 2:
        opacity = 0.3;
        break;
      case 3:
        opacity = 0.4;
        break;
      case 4:
        opacity = 0.6;
        break;
      case 5:
        opacity = 0.8;
        break;
      case 6:
        opacity = 1.0;
        break;
    }
  }

  startAnimation(bool value) {
    Future.delayed(Duration(milliseconds: 500),(){
      animate = value;
      notifyListeners();
    });
  }
}
