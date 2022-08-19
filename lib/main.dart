import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic/dynamic_page.dart';

void main() {
  // runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  FairApp.runApplication(
    _getApp(),
    plugins: {},
  );
}

dynamic _getApp() => FairApp(
  modules: {},
  delegate: {},
  child: MyApp(),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FairWidget(
      //     path: 'assets/dynamicBundles/lib_main1.fair.json',
      //     data: {'fairProps': jsonEncode({'title': '你好'})}
      //     ),
      home: MyAppHome(),
    );
  }
}

dynamic _getParams(BuildContext context, String key) {
  dynamic value = (ModalRoute.of(context)?.settings.arguments is Map) ? (ModalRoute.of(context)?.settings.arguments as Map)[key] : null;
  // print("动态页面参数为 = $value");
  return value;
}


class MyAppHome extends StatelessWidget {
  const MyAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.grey,
      ),
      onTap: (){
        print("点击了");

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context){
              // return DynamicPage();


              // return FairWidget(
              //     path: 'assets/dynamicBundles/lib_dynamic_page.fair.json',
              //     data: {'fairProps': jsonEncode({'itemTitle': '动态页面传参'})}
              // );

              return FairWidget(
                  path: 'assets/dynamicBundles/lib_main.fair.json',
                  data: {'fairProps': jsonEncode({'title': '动态页面传参'})}
              );
            })
        );
      },
    );
  }
}




//
@FairPatch()
class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, this.fairProps}) : super(key: key);

  dynamic fairProps;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @FairProps()
  var fairProps;

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    fairProps = widget.fairProps;
  }

  String getTitle() {
    return fairProps['title'];
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // 暂不支持 style: Theme.of(context).textTheme.headline4,
              // 可替换成:
              style: TextStyle(fontSize: 40, color: Color(0xffeb4237), wordSpacing: 0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}