import 'package:annotation_route/route.dart';
import './route.internal.dart';
import 'package:flutter/material.dart';
@ARouteRoot()
class AppRoute {
  static Widget getPage(String urlString, Map<String, dynamic> query) {
      ARouterInternalImpl internal = ARouterInternalImpl();
      ARouterResult routeResult = internal.findPage(ARouteOption(urlString, query), MyRouteOption(urlString, query));
      if(routeResult.state == ARouterResultState.FOUND) {
        return routeResult.widget;
      }
      return Text('NOT FOUND');
  }
}

class MyRouteOption {
  String urlpattern;
  Map<String, dynamic> query;
  MyRouteOption(this.urlpattern, this.query );
}