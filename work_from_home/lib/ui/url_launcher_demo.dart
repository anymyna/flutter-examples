/**
 * @描述 用于在移动平台中启动URL。
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019-11-03
 *
 */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UrlLauncherState();
  }
}

class _UrlLauncherState extends State<UrlLauncherDemo> {
  String _rel = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("url_launcher"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: RaisedButton(
                onPressed: () {
                  const url = 'tel:11111110';
                  _launchURL(url);
                },
                child: Text("拨打电话给我吧！"),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url = 'sms:13166688899';
                    _launchURL(url);
                  },
                  child: Text("发送短信"),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 4),
                child: RaisedButton(
                  onPressed: () {
                    const url = 'mailto:superluo666@gmail.com?subject=Test&body=测试跳转发送邮件';
                    _launchURL(url);
                  },
                  child: Text("发送邮件"),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: RaisedButton(
                onPressed: () {
                  const url = 'https://github.com';
                  _launchURL(url);
                },
                child: Text("默认浏览器中打开URL"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: RaisedButton(
                onPressed: () {
                  const url = 'weixin://';
                  _launchURL(url);
                },
                child: Text("打开微信"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: RaisedButton(
                onPressed: () {
                  const url = 'taobao://item.taobao.com/item.html?id=443534567';
                  _launchURL(url);
                },
                child: Text("打开淘宝"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: RaisedButton(
                onPressed: () {
                  const url = 'baidumap://map/marker';
                  _launchURL(url);
                },
                child: Text("打开百度地图"),
              ),
            ),


            Text(_rel),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      setState(() {
        _rel = 'Could not launch $url';
      });
    }
  }
}
