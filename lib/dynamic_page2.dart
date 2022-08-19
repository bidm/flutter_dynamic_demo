
import 'package:fair/fair.dart';
import 'package:flutter/material.dart';


@FairPatch()
class DynamicPage2 extends StatefulWidget {
  dynamic fairProps;
  DynamicPage2(dynamic data){
    fairProps = data;
  }

  @override
  State<DynamicPage2> createState() => _DynamicPage2State();
}

class _DynamicPage2State extends State<DynamicPage2> {

  @FairProps()
  var fairProps;

  @override
  void initState() {
    // TODO: implement initState
    fairProps = widget.fairProps;
    print("动态参数 = $fairProps");
    onLoad();
  }

  void onLoad(){
    String name = fairProps["name"];
    String path = fairProps["path"];
    Map data = fairProps["data"];
    String pageName = data["pageName"];

    print("动态参数解析 - $name - $path - $fairProps - $pageName");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DynamicPage2"),
        ),
        body: Center(
          child: FloatingActionButton(
            child: Text("FloatingActionButton FloatingActionButton"),
              onPressed: (){
                print("点击了 FloatingActionButton");
              }
          ),
        ),
      ),
    );
  }
}

