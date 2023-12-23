
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget wAppBar({String sTitle = "", bool bIsHomeScreen = false}) {
  return AppBar(
    leading: InkWell(child:  Icon(bIsHomeScreen ? Icons.home_filled : Icons.arrow_back),),
    title: Text(sTitle),
  );
}