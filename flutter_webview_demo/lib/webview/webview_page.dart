import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
**  与H5端规定好的js回调flutter的方法名常量类
*/
class JSFunctionName{
  static const String JS_postStatus = 'postStatus'; // 方法名与H5端规定好
  static const String JS_otherFunction = 'otherFunction';
}

// webview 
class WebviewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebviewPage>{
  WebViewController _controller;// web控制器
  String _webTitle;// 网页标题
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(_webTitle),// 报错
        title: Text('$_webTitle'),// 正常运行
      ),
      body: WebView(
        initialUrl: 'https://www.baidu.com',
        // 加载的网页
        // initialUrl: 'https://site.sonicmoving.cn/extension-templates/views/brand.html?id=01ff9194-76ab-4080-9460-4a1412f75e64&rootTemplateId=2&__soundbusmanagerid__=5b8e4bfe36a80a00062ecd17&merchantId=80d7b2d627de45759fe754aba507a3f0&__soundbusoptions__=%257b%2522surprise%2522%253atrue%257d&__x=c2b40a6d-0914-4b88-8880-1b47d35cc914&__soundbusts__=b179adbcb4510012a376beebd07d18ae&__soundbusapp__=com.soundbus.sharebus&__soundbusudf__=5c90480602cfc60006f3705b&__soundbusno__=27BE346D04DE17C5471BA80EA58F02B3CBC48A82&__soundbusyx__=24.479710,118.166144&__soundbusuid__=5c90480602cfc60006f3705b',
        // 允许js执行
        javascriptMode: JavascriptMode.unrestricted,
        /*
        **  拦截
        */
        navigationDelegate:(NavigationRequest request){
          if (request.url.startsWith("https://www.baidu")) {

            return NavigationDecision.navigate;// 允许路由
          }
          return NavigationDecision.prevent;// 阻止路由替换
        } ,
        /*
        **  js调用flutter（例如iOS：类似iOS的js调用原生，通过注册与webview端沟通好的方法‘postStatus’,onMessageReceived中执行响应）
        */
        javascriptChannels: <JavascriptChannel>[
          JavascriptChannel(
            name: JSFunctionName.JS_postStatus,
            onMessageReceived: (JavascriptMessage message){
              print(message);
            },
          ),
          // 如果还有其他方法。。。
          // JavascriptChannel(
          //   name: JSFunctionName.JS_otherFunction,
          //   onMessageReceived: (JavascriptMessage message){
          //     print(message);
          //   },
          // ),
        ].toSet(),
        /*
        **  flutter调用js（例如iOS：监听网页的title）
        */
        // 页面创建完成
        onWebViewCreated: (controller){
          _controller = controller;
        },
        // 页面加载结束
        onPageFinished: (url){
          _controller.evaluateJavascript("document.title").then((result){
            setState(() {
              print(result);
              _webTitle = result;
            });
          });
        },
      ),
    );
  }
}
