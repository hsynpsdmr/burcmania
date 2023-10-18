import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_viewmodel.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../horoscope/service/horoscope_service.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    getAllHoroscope();
    completeToSplash();
  }

  Future<void> getAllHoroscope() async {
    await HoroscopeService().getAllHoroscope();
  }

  Future<void> completeToSplash() async {
    Timer(const Duration(seconds: 2), () => navigation.navigateToPageClear(path: NavigationConstants.homeView));
  }
}
