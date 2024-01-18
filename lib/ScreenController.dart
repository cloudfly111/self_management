import 'package:flutter/cupertino.dart';
import 'package:self_management/screens/HealthStatusScreen.dart';
import 'package:self_management/screens/HomeScreen.dart';
import 'package:self_management/screens/LoginScreen.dart';
import 'package:self_management/screens/StressControlScreen.dart';
import 'package:self_management/screens/WelcomeScreen.dart';
import 'package:self_management/screens/WorkScreen.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';
import 'ThemeColors.dart';

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

/**頁面控制器
 * - input：輸入頁面類型
 * - output：輸出對應頁面
 * */
class ScreenController extends StatefulWidget {
  ScreenType type;

  ScreenController({this.type = ScreenType.NONE});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  ///目前頁面類型
  ScreenType _currentScreenType = ScreenType.NONE;
  //設定 BottomNavigation 子頁面 ---------
  ///子頁面元件List
  List<BottomNavigationBarItem> subScreenList = [];
  ///子頁面類型List
  List<ScreenType> subScreenTypeList = [
    ScreenType.HOME,
    ScreenType.WORK,
    ScreenType.HEALTH,
    ScreenType.STRESS
  ];

  @override
  void initState() {
    super.initState();
    //初始化目前頁面類型
    _currentScreenType = this.widget.type;
    //如為歡迎頁，會倒數六秒後切到首頁
    if (_currentScreenType == ScreenType.WELCOME) {
      _welcomeProcess();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("_currentScreenType=$_currentScreenType");
   // 如為歡迎頁：直接顯示歡迎頁元件，其他頁面則放在頂端 App bar 和 底部 bottomNavigationBar 中間
    return (_currentScreenType == ScreenType.WELCOME)
        ? _wScreenContent(_currentScreenType)
        : Scaffold(
            appBar: (_currentScreenType == ScreenType.WELCOME)
                ? null
                : wAppBar(
                    sTitle: ScreenNameController(_currentScreenType),
                    bIsHomeScreen: _currentScreenType == ScreenType.HOME),
            body: _wScreenContent(_currentScreenType),
            bottomNavigationBar: _wBottomNavigationBar(
                _currentScreenType, subScreenTypeList, subScreenList),
          );
  }

  ///依類型切換對應頁面元件
  Widget _wScreenContent(ScreenType type) {
    print("_ScreenController[TYPE] = $type");
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
    } else if(type == ScreenType.WELCOME){
      return WelcomeScreen();
    }else{
      return Container();
    }
  }

  ///設定歡迎頁倒數時間
  _welcomeProcess() {
    Timer(Duration(seconds: 6), () {
      setState(() {
        //設定首頁子頁面內容
        _setSubScreenItem();
        //設定目前頁面切換到首頁
        _currentScreenType = ScreenType.HOME;
      });
    });
  }

  ///依子頁面類型，設定對應的 BottomNavigation Item
  _setSubScreenItem() {
    if (subScreenTypeList.isNotEmpty && subScreenList.isEmpty) {
      for (ScreenType subType in subScreenTypeList) {
        _addBottomNavigationBarItem(_createBottomNavigationBarItem(subType));
        print(subType);
      }
      setState(() {
        print(subScreenList.length);
      });
    }
  }

  ///加入 BottomNavigationBarItem 到 BottomNavigation子頁面元件List
  _addBottomNavigationBarItem(BottomNavigationBarItem item) {
    subScreenList.add(item);
  }

  ///依頁面類型建立 BottomNavigationBarItem
  BottomNavigationBarItem _createBottomNavigationBarItem(ScreenType type) {
    return BottomNavigationBarItem(
        icon: _createScreenTypeIcon(type), label: ScreenNameController(type));
  }

  /// 依頁面類型回傳對應圖案
  Widget _createScreenTypeIcon(ScreenType type) {
    if (type == ScreenType.WORK) {
      return Icon(Icons.work_outlined);
    } else if (type == ScreenType.HEALTH) {
      return Icon(Icons.health_and_safety_outlined);
    } else if (type == ScreenType.STRESS) {
      return Icon(Icons.analytics_outlined);
    } else {
      return Icon(Icons.home_filled);
    }
  }

  ///依頁面類型切換頁面且設定對應文字與圖案
  Widget _wBottomNavigationBar(ScreenType type, List<ScreenType> list,
      List<BottomNavigationBarItem> subScreenList) {
    var _onTapEvent = (int iItemCount) {
      setState(() {
        _currentScreenType = list[iItemCount];
      });
    };

    return BottomNavigationBar(
      items: subScreenList,
      currentIndex: list.indexOf(_currentScreenType),
      type: BottomNavigationBarType.fixed,
      onTap: _onTapEvent,
      backgroundColor: ThemeColors.colorD4A373,
      selectedItemColor: ThemeColors.colorFAEDCD,
      unselectedItemColor: ThemeColors.colorFAEDCD.withOpacity(.6),
      selectedFontSize: 14,
      unselectedFontSize: 14,
    );
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
