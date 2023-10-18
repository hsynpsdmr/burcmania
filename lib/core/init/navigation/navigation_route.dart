import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../view/home/view/home_view.dart';
import '../../../../view/onboard/view/onboard_view.dart';
import '../../../../view/splash/view/splash_view.dart';
import '../../../view/horoscope/view/horoscope_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    //Sayfa yönlendirmeleri buraya yazılır

    switch (args.name) {
      case NavigationConstants.homeView:
        return normalNavigate(const HomeView(), NavigationConstants.homeView);
      case NavigationConstants.onBoardView:
        return normalNavigate(const OnBoardView(), NavigationConstants.onBoardView);
      case NavigationConstants.splashView:
        return normalNavigate(const SplashView(), NavigationConstants.splashView);
      case NavigationConstants.horoscopeView:
        final arguments = args.arguments as Map;
        return normalNavigate(HoroscopeView(horoKey: arguments['horoKey']), NavigationConstants.horoscopeView);
      default:
        return normalNavigate(const Scaffold(), '');
    }
  }

  PageRoute normalNavigate(Widget widget, String pageName) {
    return Platform.isAndroid
        ? MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName))
        : CupertinoPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }

  PageRoute normalNavigateToPop(Widget widget, String pageName) {
    return Platform.isAndroid
        ? MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName))
        : CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true, settings: RouteSettings(name: pageName));
  }
}
