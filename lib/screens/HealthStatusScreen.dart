import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';

/**健康狀態頁*/
class HealthStatusScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HealthStatusScreenState();
}

class _HealthStatusScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wAppBar(sTitle: StaticInfor.sHealStatusName),
    );
  }
}
