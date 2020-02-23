import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:annotation_route/route.dart';

@ARoute(url: 'page://page1')
class FirstPage extends StatelessWidget {
  FirstPage(this.option);
  dynamic option;

  //ThirdPage(ARouteOption option) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
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
          ],
        ),
      ),
    );
  }
}
