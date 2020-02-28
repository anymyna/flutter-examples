
import 'package:flutter/material.dart';
import 'package:share/share.dart' as ShareAll;
import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'dart:typed_data';

import 'package:flutter/services.dart';

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
            ShareAll.Share.share(
                '【百度一下】\nhttps://baidu.com');
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Share text'),
                  onPressed: () async => await _shareText(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                RaisedButton(
                  child: Text('Share image'),
                  onPressed: () async => await _shareImage(),
                ),

              ],
            ),



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

Future<void> _shareText() async {
  try {
    Share.text('share text title',
        'This is my text to share with other applications.', 'text/plain');
  } catch (e) {
    print('error: $e');
  }
}

Future<void> _shareImage() async {
  try {
    final ByteData bytes = await rootBundle.load('assets/images/logo.jpg');
    await Share.file(
        'esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png',
        text: 'My optional text.');
  } catch (e) {
    print('error: $e');
  }
}

