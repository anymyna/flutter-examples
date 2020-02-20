// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:example/custom_route_name_page.dart';
import 'package:example/custom_route_page.dart';
import 'package:example/home_page.dart';
import 'package:example/one_arguement_page.dart';
import 'package:example/third_page.dart';
import 'package:example/second_page.dart';
import 'package:example/two_arguement_page.dart';

const ROUTE_CUSTOM = 'custom';
const ROUTE_CUSTOM_ROUTE_PAGE = 'custom_route_page';
const ROUTE_HOME = '/';
const ROUTE_ONE_ARGUMENT_PAGE = 'one_argument_page';
const ROUTE_THIRD_PAGE = 'third_page';
const ROUTE_SECOND_PAGE = 'second_page';
const ROUTE_TWO_ARGUMENT_PAGE = 'two_argument_page';

RouteFactory onGenerateRoute = (settings) => Map.fromEntries([
      ..._custom.entries,
      ..._customRoutePage.entries,
      ..._home.entries,
      ..._oneArgumentPage.entries,
      ..._thirdPage.entries,
      ..._secondPage.entries,
      ..._twoArgumentPage.entries,
    ])[settings.name](settings);

Map<String, RouteFactory> _custom = <String, RouteFactory>{
  'custom': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => CustomRoutePageName(),
      ),
};
Map<String, RouteFactory> _customRoutePage = CustomRoutePage.route;
Map<String, RouteFactory> _home = <String, RouteFactory>{
  '/': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => HomePage(),
      ),
};
Map<String, RouteFactory> _oneArgumentPage = <String, RouteFactory>{
  'one_argument_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) =>
            OneArgumentPage(title: settings.arguments),
      ),
};
Map<String, RouteFactory> _thirdPage = <String, RouteFactory>{
  'third_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => ThirdPage(),
      ),
};
Map<String, RouteFactory> _secondPage = <String, RouteFactory>{
  'second_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => SecondPage(),
      ),
};
Map<String, RouteFactory> _twoArgumentPage = <String, RouteFactory>{
  'two_argument_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) {
          final arguments = settings.arguments as Map<String, dynamic>;
          return TwoArgumentPage(
            title: arguments['title'],
            subTitle: arguments['subTitle'],
          );
        },
      ),
};
