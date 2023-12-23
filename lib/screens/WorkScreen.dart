import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../StaticInfor.dart';
import '../widget/public/AppBar.dart';

/**工作狀態頁*/
class WorkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wAppBar(sTitle: StaticInfor.sWorkName),
    );
  }
}
