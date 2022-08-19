import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

// @FairPatch()
class IfEqualBoolPage extends StatefulWidget {
  var fairProps;

  IfEqualBoolPage(dynamic data) {
    fairProps = data;
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<IfEqualBoolPage> {

  @FairProps()
  var fairProps;

  late String _title;
  late int _count;

  // JS生命周期方法--在JS加载完成自动调用
  void onLoad() {
    _title = fairProps['pageName'];
    _count = fairProps['count'];
  }

  void onTapText() {
    _count = _count + 1;
    setState(() {});
  }

  // 逻辑方法
  bool _countCanMod2() {
    return _count % 2 == 1;
  }

  @override
  void initState() {
    super.initState();
    fairProps = widget.fairProps;
    onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sugar.ifEqualBool 为逻辑和布局混编场景下的语法糖
            Sugar.ifEqualBool(_countCanMod2(),
                falseValue: Text("falseValue"),
                trueValue: Text("trueValue")),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('_count = $_count'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('if _count % 2 == 1,  update image !'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.threesixty),
            onPressed: onTapText,
          )
        ],
      ),
    );
  }
}