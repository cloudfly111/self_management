

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';

/**首頁*/
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeScreenState() ;
}

class _HomeScreenState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: wAppBar(sTitle: StaticInfor.sHomeScreenName,bIsHomeScreen: true),
    );
  }

}