import 'package:flutter/material.dart';

import '../../view/splash/view/splash_view.dart';
import '../core/constants/enum/preferences_keys_enum.dart';
import '../core/init/memory/preferences_manager.dart';

Widget initiator() {
  //uygulamayı ilk defa indiren kişi için açılış sayfası eklenecek ise buradan eklenir.
  int isFirstEntry = PreferencesManager.instance.getIntVal(PreferencesKeys.isFirstEntry);
  if (isFirstEntry == -1) {
    PreferencesManager.instance.setIntVal(PreferencesKeys.isFirstEntry, 0);
    return const SplashView();
  } else {
    return const SplashView();
  }
}
