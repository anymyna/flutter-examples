import 'package:flutter/services.dart';

///一个日志打印工具类
class LogUtils {
  LogUtils._();

  //第一步：设置平台，并进行命名
  static const _platform = const MethodChannel('com.myna.flutter.plugins/log');

  //第二步，设置相关需要传递的方法
  //invokeMethod方法接收的参数，第一个必选参数，设置的是方法的名称；后面的参数为可选的需要传递的参数
  static void i(String tag, String msg) {
    _platform.invokeMethod('logI', {'tag': tag, 'msg': msg});
  }

  static void d(String tag, String msg) {
    _platform.invokeMethod('logD', {'tag': tag, 'msg': msg});
  }

  static void v(String tag, String msg) {
    _platform.invokeMethod('logV', {'tag': tag, 'msg': msg});
  }

  static void w(String tag, String msg) {
    _platform.invokeMethod('logW', {'tag': tag, 'msg': msg});
  }

  static void e(String tag, String msg) {
    _platform.invokeMethod('logE', {'tag': tag, 'msg': msg});
  }

}

