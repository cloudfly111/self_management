import 'package:flutter/cupertino.dart';
import 'package:self_management/screens/HealthStatusScreen.dart';
import 'package:self_management/screens/HomeScreen.dart';
import 'package:self_management/screens/LoginScreen.dart';
import 'package:self_management/screens/StressControlScreen.dart';
import 'package:self_management/screens/WelcomeScreen.dart';
import 'package:self_management/screens/WorkScreen.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ScreenController.dart';
import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';

/**定義頁面類型*/
enum ScreenType {
  ///首頁
  HOME,

  ///歡迎頁
  WELCOME,

  ///登入頁
  LOGIN,

  ///健康狀態頁
  HEALTH,

  ///工作狀態頁
  WORK,

  ///壓力頁
  STRESS,

  ///無預設類型
  NONE,
}

/**頁面控制器*/
class ScreenController extends StatefulWidget {
  ScreenType type;

  ScreenController({this.type = ScreenType.NONE});

  @override
  State< ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  ScreenType _currentScreenType = ScreenType.NONE;

  @override
  void initState() {
    _currentScreenType = this.widget.type;
    super.initState();
    _welcomeProcess();
  }

  @override
  Widget build(BuildContext context) {
    return _wScreenContent(_currentScreenType);
  }

  Widget _wScreenContent(ScreenType type) {
    return ScreenNameController(type);
  }

  ///歡迎頁等待時間
  _welcomeProcess(){
    Timer(Duration(seconds: 6), () {
      setState(() {
        _currentScreenType = ScreenType.HOME;
      });
    });
  }

  ///依頁面類型切換頁面
  Widget ScreenNameController(ScreenType type) {
    if (type == ScreenType.HOME) {
      return HomeScreen();
    } else if (type == ScreenType.HEALTH) {
      return HealthStatusScreen();
    } else if (type == ScreenType.LOGIN) {
      return LoginScreen();
    } else if (type == ScreenType.STRESS) {
      return StressScontrolScreen();
    } else if (type == ScreenType.WORK) {
      return WorkScreen();
    } else {
      return WelcomeScreen();
    }
  }



}

///依頁面類型回傳對應頁面文字
String ScreenNameController(ScreenType type) {
  if (type == ScreenType.HOME) {
    return StaticInfor.sHomeScreenName;
  } else if (type == ScreenType.HEALTH) {
    return StaticInfor.sHealStatusName;
  } else if (type == ScreenType.LOGIN) {
    return StaticInfor.sLoginScreenName;
  } else if (type == ScreenType.STRESS) {
    return StaticInfor.sStressControlName;
  } else if (type == ScreenType.WORK) {
    return StaticInfor.sWorkName;
  } else {
    return "";
  }
}
