import 'dart:convert';

import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic/dynamic_page2.dart';

import 'dynamic_page1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FairApp.runApplication(
      FairApp(
          child: MyApp()
      ),
  );
}

// @FairPatch()
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter动态化"),
        ),
        body: const MyHomePage(),
      ),
      routes: {
        'fair_page': (context) => FairWidget(
                name: '随便写的',
                path: 'assets/dynamicBundles/lib_dynamic_page2.fair.json',
                data: {
                  'fairProps':
                      jsonEncode({'pageName': '动态界面', '_count': 58})
                }),
      },
    );
  }
}
/// 获取路由传递的参数
dynamic _getParams(BuildContext context, String key) =>
    (ModalRoute.of(context)?.settings.arguments is Map) ? (ModalRoute.of(context)?.settings.arguments as Map)[key] : null;

dynamic _getParams1(BuildContext context, String key) {
  dynamic value = (ModalRoute.of(context)?.settings.arguments is Map) ? (ModalRoute.of(context)?.settings.arguments as Map)[key] : null;
  // print("动态页面参数为 = $value");
  return value;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                color: Colors.grey,
                child: Text("data - $index"),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, 'fair_page',
                  arguments: {'name': 'DynamicPage2', 'path': 'assets/dynamicBundles/lib_dynamic_page2.fair.json', 'data': {"fairProps": {'pageName': '动态界面', '_count': 58}}});



              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context){
              //       // return IfEqualBoolPage({"pageName": "动态Page", "count": 12});
              //       return DynamicPage2({});
              //     })
              // );
            },
          );
        }
    );
  }
}

