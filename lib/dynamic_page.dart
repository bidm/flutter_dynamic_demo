
import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class DynamicPage extends StatefulWidget {

  dynamic fairProps;
  DynamicPage({this.fairProps});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {

  @FairProps()
  var fairProps;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fairProps = widget.fairProps;
  }

  String getItemTitle() {
    if (fairProps == null) return "无参数";
    return fairProps['itemTitle'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DynamicPage"),
      ),
      body: RaisedButton(
          onPressed: (){
            print("点击了Btn");
          },
        child: Text("DynamicPage - ${getItemTitle()}"),
      ),
    );
  }
}
