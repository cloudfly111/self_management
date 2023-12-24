

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_management/ScreenController.dart';
import 'package:self_management/ThemeColors.dart';

import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';

/**首頁*/
class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<BottomNavigationBarItem> subScreenList= [];
  List<ScreenType> subScreenTypeList= [ScreenType.HOME,ScreenType.WORK,ScreenType.HEALTH,ScreenType.STRESS];

  @override
  void initState() {
    super.initState();
    _setSubScreenItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wAppBar(sTitle: StaticInfor.sHomeScreenName,bIsHomeScreen: true),
      bottomNavigationBar: BottomNavigationBar(items: subScreenList, type: BottomNavigationBarType.fixed,
          backgroundColor: ThemeColors.colorD4A373,
          selectedItemColor: ThemeColors.colorFAEDCD,
          unselectedItemColor: ThemeColors.colorFAEDCD.withOpacity(.6),
          selectedFontSize: 14,
          unselectedFontSize: 14,),
    );
  }
  

  _setSubScreenItem(){
    if(subScreenTypeList.isNotEmpty){
      for(ScreenType subType in subScreenTypeList){
        _addBottomNavigationBarItem(_createBottomNavigationBarItem(subType));
        print(subType);
      }
      setState(() {
        print(subScreenList.length);
      });
    }

  }

  _addBottomNavigationBarItem(BottomNavigationBarItem item){
    subScreenList.add(item);
  }

  BottomNavigationBarItem _createBottomNavigationBarItem(ScreenType type){
    return BottomNavigationBarItem(icon: _createScreenTypeIcon(type),label: ScreenNameController(type));
  }

  Widget _createScreenTypeIcon(ScreenType type){
    if(type == ScreenType.WORK){
      return Icon(Icons.work_outlined);
    }else if(type == ScreenType.HEALTH){
      return Icon(Icons.health_and_safety_outlined);
    }else if(type == ScreenType.STRESS){
      return Icon(Icons.analytics_outlined);
    }else{
      return Icon(Icons.home_filled);

    }

  }
}