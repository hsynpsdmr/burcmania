import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_viewmodel.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => myContext = context;
  @override
  void init() {}

  Future<void> goHoroscope(String horoKey) async {
    navigation.navigateToPage(path: NavigationConstants.horoscopeView, object: {'horoKey': horoKey});
  }
}
