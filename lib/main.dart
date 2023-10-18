import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/language/locale_keys.g.dart';
import 'core/init/memory/preferences_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'service/initilization.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.langAssetPath,
      startLocale: LanguageManager.instance.enLocale,
      child: const MyApp(),
    ),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferencesManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      title: LocaleKeys.base_app_name,
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      themeMode: ThemeMode.system,
      home: initiator(),
    );
  }
}
