import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_demo/webview/webview_page.dart';
void main(){
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: CupertinoButton(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          color: Colors.blue,
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
              builder: (context){
                return WebviewPage();
              }
            ));
          },
          child: Text('打开网页',style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}