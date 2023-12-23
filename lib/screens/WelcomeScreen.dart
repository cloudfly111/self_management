import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_management/ThemeColors.dart';

import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';

/**歡迎頁*/
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: ThemeColors.colorD4A373,
      alignment: Alignment.center,
      child: const Icon(
        Icons.analytics,
        size: 100,
        color:ThemeColors.colorFEFAE0,
      ),
    ));
  }
}
