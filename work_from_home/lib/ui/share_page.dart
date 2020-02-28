
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePage extends StatefulWidget {
  @override
  ShareState createState() => ShareState();
}

class ShareState extends State<SharePage> {
  // Generate dialog
  AlertDialog dialog = AlertDialog(
      content: Text(
        "Hello World!",
        style: TextStyle(fontSize: 30.0),
      ));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SharePage"),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Share"),
    onPressed: (){
            Share.share(
                '【百度一下】\nhttps://baidu.com');
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  color: Colors.blue,//给OutlineButton设置背景颜色是没有用的
                  child: Text("SimpleDialog"),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) =>
                          SimpleDialog(title: Text("标题"), children: <Widget>[
                            SimpleDialogOption(child: Text('内容1')),
                            SimpleDialogOption(child: Text('内容2')),
                          ]),
                    );
                  },
                ),
              ],
            )
          ],
        )
    )
    ;
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) =>
      new AlertDialog(
          title: new Text("Dialog Title"),
          content: new Text("This is my content"),
          actions: <Widget>[
            new FlatButton(child: new Text("CANCEL"), onPressed: () {
              Navigator.of(context).pop();
            },),
            new FlatButton(child: new Text("OK"), onPressed: () {
              Navigator.of(context).pop();
            },)
          ]

      ));
}


