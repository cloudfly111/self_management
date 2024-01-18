
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_management/ThemeColors.dart';

/** App Bar 共用元件**/
PreferredSizeWidget wAppBar({String sTitle = "", bool bIsHomeScreen = false}) {
  return AppBar(
    elevation: 0,
    shadowColor: ThemeColors.colorE9EDC9,
    backgroundColor: ThemeColors.colorFAEDCD,
    leading: InkWell(child:  Icon(bIsHomeScreen ? Icons.home_filled : Icons.arrow_back),),
    title: Text(sTitle),
  );
}