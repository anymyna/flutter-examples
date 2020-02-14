import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../ui/home_page.dart';
import '../ui/transition_page.dart';
import '../ui/event_bus_demo.dart';

//欢迎页面
var transitionHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TransitionPage();
  },
);

// app的首页
var homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MyHomePage();
  },
);

 //sqflite数据库
var sqfliteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //return SqflitePage();
  },
);

// eventbus事件总线
var eventBusHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return EventBusPage();
  },
);

// 文件解压缩
var fileZipHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //return FileZipDemo();
    },);

//WebView（flutter_webview_plugin）
var webViewPlginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String url = params['url']?.first;
      String title = params['title']?.first;
      //return WebViewPlgin(url: url,title: title,);
    });

//WebView（flutter官方插件）
var flutterWebViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String url = params['url']?.first;
      String title = params['title']?.first;
      //return FlutterWebView(url: url,barTitle: title,);
    });


//provider状态管理
var providerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      //return ProviderDemoPage();
    });

//sharedPreferences
var spHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      //return PreferencesDemo();
    });

//flutter channel
var channelHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      //return ChannelDemo();
    });

//flutter channel
var urlLauncherHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      //return UrlLauncherDemo();
    });