import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../ui/home_page.dart';
import '../ui/dialog_page.dart';
import '../ui/banner_swiper.dart';
import '../ui/transition_page.dart';
import '../ui/event_bus_demo.dart';
import '../ui/preferences_demo.dart';
import '../ui/pointer.dart';
import '../ui/notification.dart';
import '../ui/gesture_detector.dart';
import '../ui/share_page.dart';
import '../ui/provider_demo.dart';
import '../ui/url_launcher_demo.dart';
import '../ui/video/video_page.dart';

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
    return SharePage();

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
    return PointerRoute();
    },);

//WebView（flutter_webview_plugin）
var webViewPlginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String url = params['url']?.first;
      String title = params['title']?.first;
      //return WebViewPlgin(url: url,title: title,);
      return NotificationRoute();
    });

//WebView（flutter官方插件）
var flutterWebViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String url = params['url']?.first;
      String title = params['title']?.first;
      //return FlutterWebView(url: url,barTitle: title,);
      return GestureDetectorRoute();
    });


//provider状态管理
var providerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ProviderDemoPage();
    });

//sharedPreferences
var spHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PreferencesDemo();
    });

//flutter channel
var channelHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      //return ChannelDemo();
      return VideoPage();
    });

//flutter channel
var urlLauncherHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return UrlLauncherDemo();
    });


//flutter channel
var dialogHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MyDialog();
    });


//flutter channel
var bannerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return SwiperPage();
    });