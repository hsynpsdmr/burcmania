import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_viewmodel.dart';
import '../model/horoscope_model.dart';
import '../model/horoscope_property.dart';
import '../service/horoscope_service.dart';

part 'horoscope_view_model.g.dart';

class HoroscopeViewModel = HoroscopeViewModelBase with _$HoroscopeViewModel;

abstract class HoroscopeViewModelBase with Store, BaseViewModel {
  HoroscopeModel? horoModel;
  late Horoscope<String> horo;
  TabController? tabController;
  @override
  void setContext(BuildContext context) => myContext = context;
  @override
  void init() {}

  void getHoroscopeDetail(String horoKey) {
    horoModel = HoroscopeService().getHoroscopeByKey(horoKey);
  }

  void getHoro(String horoKey) {
    horo = HoroscopeProperty.horoscopeList.singleWhere((element) => element.key == horoKey);
  }

  void customDispose() {
    tabController?.dispose();
  }
}
