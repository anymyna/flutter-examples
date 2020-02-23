import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:annotation_route/route.dart';

@ARoute(url: 'page://page2')
class SecondPage extends StatelessWidget {
  dynamic option;
  SecondPage(this.option);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            RaisedButton(
              onPressed: () {

                //导航到新路由
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
              },
              child: Text("Home Page"),
            ),
            Text("url  "+ option.urlpattern,
              textAlign: TextAlign.left,
            ),
            Text("params "+option.query[ 'test' ],
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
